## This workflow runs the HaplotypeCaller tool from GATK4 in GVCF mode 
## on a single sample in BAM format and produces a single GVCF file, 
## which can then be used by the joint-discovery workflow according 
## to the GATK Best Practices for germline short variant discovery.

version 1.0 

workflow HelloHaplotypeCaller {

	call HaplotypeCallerGVCF
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
		File intervals
	}

	String gvcf_name = basename(input_bam, ".bam") + ".g.vcf"

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
