#!/bin/bash
#SBATCH -J bam_dedup
#SBATCH -n 16
#SBATCH -t 24:00:00
#SBATCH --mem=32G
#SBATCH -o logs/bam_dedup-%A.out
#SBATCH -e logs/bam_dedup-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chengyue_zhang@brown.edu

module load picard-tools/2.9.2 java/jdk-17.0.2

bam_dir=/users/czhang91/CnR_2023/bam_files_NO_MERGE
out_dir=/users/czhang91/CnR_2023/bam_files_dedup_NO_MERGE

while IFS=$"," read -r bam_file
do
    bam_name=`echo ${bam_file} | cut -d '.' -f 1`
    echo "Processing BAM file: ${bam_file}..."
    java -jar picard.jar MarkDuplicates \
        I=${bam_dir}/${bam_file} O=${out_dir}/${bam_name}.dedup.bam M=${out_dir}/${bam_name}.dedup.metrics.txt \
        REMOVE_DUPLICATES=true\
        VALIDATION_STRINGENCY=LENIENT

done < ${bam_dir}/"1_files_to_dedup.csv"

echo "Done!"
