# This file contains a loop to run the MACS2 callpeak function 
# on a series of bam files whose names are specified by 1_files_to_call_peaks.csv.
# INPUT: UNMERGED bam files from different experimental conditions.
# OUTPUT: narrowPeak files that contain the peaks identified by MACS2.

# Tools and versions: macs/2.2.6

bam_dir=/path/to/UNMERGED/bam/files
out_dir=/path/to/macs2/files

while IFS=$"," read -r bam_file
do
    bam_name=`echo ${bam_file} | cut -d '.' -f 1`
    echo "Processing BAM file: ${bam_file}..."
    
    macs2 callpeak -t ${bam_dir}/${bam_file}  \
        --nomodel --extsize 147 -g dm \
        -n ${bam_dir}/${bam_name} \
	    --outdir ${out_dir}

done < ${bam_dir}/"1_files_to_call_peaks.csv"

echo "Done!"
