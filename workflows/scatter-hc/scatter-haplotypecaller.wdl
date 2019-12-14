version 1.0

workflow ScatterHaplotypeCallerGVCF {

    input {
        File input_bam
        File input_bam_index
        File intervals_list
    }

    String output_basename = basename(input_bam, ".bam") 

    Array[String] calling_intervals = read_lines(intervals_list)

    scatter(interval in calling_intervals) {
        call HaplotypeCallerGVCF { 
            input: 
                input_bam = input_bam,
                input_bam_index = input_bam_index,
                intervals = interval, 
                gvcf_name = output_basename + ".scatter.g.vcf"
        }
    }
    call MergeVCFs { 
        input: 
            vcfs = HaplotypeCallerGVCF.output_gvcf, 
            merged_vcf_name = output_basename + ".merged.g.vcf"
    }

    output {
        File output_gvcf = MergeVCFs.merged_vcf
    }
}

task HaplotypeCallerGVCF {

    input {
        String docker_image
        String java_opt

        File ref_fasta
        File ref_index
        File ref_dict
        File input_bam
        File input_bam_index
        String intervals
        String gvcf_name
    }

    command {
        gatk --java-options ${java_opt} HaplotypeCaller \
            -R ${ref_fasta} \
            -I ${input_bam} \
            -O ${gvcf_name} \
            -L ${intervals} \
            -ERC GVCF 
    }
    
    output {
        File output_gvcf = "${gvcf_name}"
    }

    runtime {
        docker: docker_image
    }
}

task MergeVCFs {

    input {
        String docker_image
        String java_opt

        Array[File] vcfs
        String merged_vcf_name
    }

    command {
        gatk --java-options ${java_opt} MergeVcfs \
            -I ${sep=' -I' vcfs} \
            -O ${merged_vcf_name}
    }

    output {
        File merged_vcf = "${merged_vcf_name}"
    }

    runtime {
        docker: docker_image
    }
}
