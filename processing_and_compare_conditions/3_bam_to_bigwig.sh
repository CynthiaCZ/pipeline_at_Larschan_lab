# This file contains a loop that uses the deeptools bamCoverage function
# to convert bam files specified by 1_files_to_convert.csv to bigwig files.
# INPUT: deduplicated bam files outputted from 2_bam_dedup_merged.sh.
# OUTPUT: bigwig files converted from bam files.

# Tools and versions: deeptools/3.2.1

bam_dir=/path/to/deduplicated/bam/files
genome_dir=/path/to/blacklist/genome
out_dir=/path/to/bigwig/files

while IFS=$"," read -r line
do
    echo "Constructing BigWig for Sample '${line}'..."
    name=`echo ${line} | cut -d '.' -f 1`
    bamCoverage \
    --bam ${bam_dir}/${line} \
    -o ${out_dir}/${name}.dedup.bw \
    --binSize 10 \
    --normalizeUsing CPM \
    --effectiveGenomeSize 129941135 \
    --blackListFileName ${genome_dir}/dm6-blacklist.bed \
    --extendReads \
    --centerReads \
    --exactScaling \
    --ignoreDuplicates \
    --numberOfProcessors 32
done < ${bam_dir}/"1_files_to_convert.csv"

echo "Done!"