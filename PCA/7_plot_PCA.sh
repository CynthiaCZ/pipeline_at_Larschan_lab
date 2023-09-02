#!/bin/bash
#SBATCH -J plotPCA
#SBATCH -n 32
#SBATCH --mem=64G
#SBATCH -t 6:00:00
#SBATCH -o logs/plotPCA-%A.out
#SBATCH -e logs/plotPCA-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chengyue_zhang@brown.edu

module load deeptools/3.2.1 python/2.7.12 matplotlib/2.2.4 pysam/0.15.2 py2bit/0.3.0 numpydoc/0.9.1 pybigwig/0.3.15 plotly/3.9.0 deeptoolsintervals/0.1.7 gcc/12.3.1

out_dir=/users/czhang91/CnR_2023/plot_PCA

#### multiple bam symmary 
# # merged samples
# bam_dir=/users/czhang91/CnR_2023/bam_files_dedup

# multiBamSummary bins \
#     --bamfiles ${bam_dir}/*bam \
#     -out ${out_dir}/multiBam_readCounts.npz 
    
#     --smartLabels \
#     --outRawCounts ${out_dir}/multiBam_NO_MERGE_readCounts.tab

# plotPCA -in ${out_dir}/multiBam_readCounts.npz \
# -o ${out_dir}/multiBam_PCA.png \
# -T "PCA of read counts (multiBam MERGED)"

# # NO MERGE (sample specific)
# bam_dir_no_merge=/users/czhang91/CnR_2023/bam_files_dedup_NO_MERGE

# multiBamSummary bins \
#     --bamfiles ${bam_dir_no_merge}/*bam \
#     -out ${out_dir}/multiBam_NO_MERGE_readCounts.npz 
    
#     # --smartLabels \
#     # --outRawCounts ${out_dir}/multiBam_NO_MERGE_readCounts.tab

# plotPCA -in ${out_dir}/multiBam_NO_MERGE_readCounts.npz \
# -o ${out_dir}/multiBam_NO_MERGE_PCA.png \
# -T "PCA of read counts (multiBam NO MERGE)"

#### multiple bigwig summary
# # merged samples
# bw_dir=/users/czhang91/CnR_2023/bigwig_files

# multiBigwigSummary bins \
#     -b ${bw_dir}/*bw \
#     -p 32 \
#     -out ${out_dir}/multiBW_readCounts.npz

#     # --smartLabels \

# plotPCA -in ${out_dir}/multiBW_readCounts.npz \
# -o ${out_dir}/multiBW_PCA.png \
# -T "PCA of read counts (multiBigwig MERGED)"

# # NO MERGE (sample specific)
# bw_dir_no_merge=/users/czhang91/CnR_2023/bigwig_files_NO_MERGE

# multiBigwigSummary bins \
#     -b ${bw_dir_no_merge}/*bw \
#     -p 32 \
#     -out ${out_dir}/multiBW_NO_MERGE_readCounts.npz

#     # --smartLabels \

# plotPCA -in ${out_dir}/multiBW_NO_MERGE_readCounts.npz \
# -o ${out_dir}/multiBW_NO_MERGE_PCA.png \
# -T "PCA of read counts (multiBigwig NO MERGE)"

#### multiple bigwig summary antibody specific
### CLAMP
# merged samples
bw_dir=/users/czhang91/CnR_2023/bigwig_files

multiBigwigSummary bins \
    -b ${bw_dir}/CLAMP*bw \
    -p 32 \
    -out ${out_dir}/multiBW_readCounts_CLAMP.npz

    # --smartLabels \

plotPCA -in ${out_dir}/multiBW_readCounts_CLAMP.npz \
-o ${out_dir}/multiBW_PCA_CLAMP.png \
-T "PCA of read counts (multiBigwig MERGED CLAMP)"

# NO MERGE (sample specific)
bw_dir_no_merge=/users/czhang91/CnR_2023/bigwig_files_NO_MERGE

multiBigwigSummary bins \
    -b ${bw_dir_no_merge}/CLAMP*bw \
    -p 32 \
    -out ${out_dir}/multiBW_NO_MERGE_readCounts_CLAMP.npz

    # --smartLabels \

plotPCA -in ${out_dir}/multiBW_NO_MERGE_readCounts_CLAMP.npz \
-o ${out_dir}/multiBW_NO_MERGE_PCA_CLAMP.png \
-T "PCA of read counts (multiBigwig NO MERGE CLAMP)"


### MSL2
# merged samples
bw_dir=/users/czhang91/CnR_2023/bigwig_files

multiBigwigSummary bins \
    -b ${bw_dir}/MSL2*bw \
    -p 32 \
    -out ${out_dir}/multiBW_readCounts_MSL2.npz

    # --smartLabels \

plotPCA -in ${out_dir}/multiBW_readCounts_MSL2.npz \
-o ${out_dir}/multiBW_PCA_MSL2.png \
-T "PCA of read counts (multiBigwig MERGED MSL2)"

# NO MERGE (sample specific)
bw_dir_no_merge=/users/czhang91/CnR_2023/bigwig_files_NO_MERGE

multiBigwigSummary bins \
    -b ${bw_dir_no_merge}/MSL2*bw \
    -p 32 \
    -out ${out_dir}/multiBW_NO_MERGE_readCounts_MSL2.npz

    # --smartLabels \

plotPCA -in ${out_dir}/multiBW_NO_MERGE_readCounts_MSL2.npz \
-o ${out_dir}/multiBW_NO_MERGE_PCA_MSL2.png \
-T "PCA of read counts (multiBigwig NO MERGE MSL2)"

