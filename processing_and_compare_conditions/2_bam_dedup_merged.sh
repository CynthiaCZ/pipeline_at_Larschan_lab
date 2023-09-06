# This file contains a loop to run the Picard MarkDuplicates function 
# on a series of bam files whose names are specified by 1_files_to_dedup.csv.
# INPUT: MERGED bam files from different experimental conditions.
# OUTPUT: deduplicated bam files.

# Tools and versions: picard-tools/2.9.2 java/jdk-17.0.2

bam_dir=/path/to/MERGED/bam/files
out_dir=/path/to/deduplicated/bam/files

while IFS=$"," read -r bam_file
do
    bam_name=`echo ${bam_file} | cut -d '.' -f 1,2`
    echo "Processing BAM file: ${bam_file}..."
    java -jar picard.jar MarkDuplicates \
        I=${bam_dir}/${bam_file} O=${out_dir}/${bam_name}.dedup.bam M=${out_dir}/${bam_name}.dedup.metrics.txt \
        REMOVE_DUPLICATES=true\
        VALIDATION_STRINGENCY=LENIENT

done < ${bam_dir}/"1_files_to_dedup.csv"

echo "Done!"

