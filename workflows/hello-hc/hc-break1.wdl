## This workflow is intentionally broken!

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

	# The basename() function is missing its right parenthesis (rparen)
	String gvcf_name = basename(input_bam, ".bam" + ".g.vcf"

	command {
		gatk --java-options ${java_opt} HaploCaller \
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
