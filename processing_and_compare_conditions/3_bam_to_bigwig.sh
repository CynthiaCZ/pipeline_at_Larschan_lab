#!/bin/bash
#SBATCH -J bam_to_bigwig
#SBATCH -n 32
#SBATCH --mem=32G
#SBATCH -t 6:00:00
#SBATCH -o /users/czhang91/CnR_2023/logs/compare_cond-%A.out
#SBATCH -e /users/czhang91/CnR_2023/logs/compare_cond-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chengyue_zhang@brown.edu

module load deeptools/3.2.1 python/2.7.12 matplotlib/2.2.4 pysam/0.15.2 py2bit/0.3.0 numpydoc/0.9.1 pybigwig/0.3.15 plotly/3.9.0 deeptoolsintervals/0.1.7

bam_dir=/users/czhang91/CnR_2023/bam_files_dedup
genome_dir=/users/czhang91/CnR_2023/genome
out_dir=/users/czhang91/CnR_2023/bigwig_files

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
done < ${bam_dir}/"1_files.csv"

echo "Done!"