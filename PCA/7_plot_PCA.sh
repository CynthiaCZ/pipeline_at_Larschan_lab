# This file uses the deeptools plotPCA function to visualize the results 
# from deeptools multiBamSummary and multiBigwigSummary
# Sample outputs of the PCA plots are included.
# INPUT: merge/unmerged bam/bigwig files
# OUTPUT: narrowPeak files that contain the peaks identified by MACS2.

# Tools and versions: deeptools/3.2.1

out_dir=/path/to/outputs
bam_dir=/path/to/merged_bam_files
bam_dir_no_merge=/path/to/unmerged_bam_files
bw_dir=/path/to/merged_bw_files
bw_dir_no_merge=/path/to/unmerged_bw_files

### multiple bam symmary 

# merged samples
multiBamSummary bins \
    --bamfiles ${bam_dir}/*bam \
    -out ${out_dir}/multiBam_readCounts.npz

plotPCA -in ${out_dir}/multiBam_readCounts.npz \
-o ${out_dir}/multiBam_PCA.png \
-T "PCA of read counts (multiBam MERGED)"

# unmerged (sample specific)
multiBamSummary bins \
    --bamfiles ${bam_dir_no_merge}/*bam \
    -out ${out_dir}/multiBam_NO_MERGE_readCounts.npz 

plotPCA -in ${out_dir}/multiBam_NO_MERGE_readCounts.npz \
-o ${out_dir}/multiBam_NO_MERGE_PCA.png \
-T "PCA of read counts (multiBam NO MERGE)"


### multiple bigwig summary

# merged samples
multiBigwigSummary bins \
    -b ${bw_dir}/*bw \
    -p 32 \
    -out ${out_dir}/multiBW_readCounts.npz

plotPCA -in ${out_dir}/multiBW_readCounts.npz \
-o ${out_dir}/multiBW_PCA.png \
-T "PCA of read counts (multiBigwig MERGED)"

# unmerged (sample specific)
multiBigwigSummary bins \
    -b ${bw_dir_no_merge}/*bw \
    -p 32 \
    -out ${out_dir}/multiBW_NO_MERGE_readCounts.npz

plotPCA -in ${out_dir}/multiBW_NO_MERGE_readCounts.npz \
-o ${out_dir}/multiBW_NO_MERGE_PCA.png \
-T "PCA of read counts (multiBigwig NO MERGE)"


#### multiple bigwig summary antibody specific

### CLAMP antibody
# merged samples
multiBigwigSummary bins \
    -b ${bw_dir}/CLAMP*bw \
    -p 32 \
    -out ${out_dir}/multiBW_readCounts_CLAMP.npz

plotPCA -in ${out_dir}/multiBW_readCounts_CLAMP.npz \
-o ${out_dir}/multiBW_PCA_CLAMP.png \
-T "PCA of read counts (multiBigwig MERGED CLAMP)"

# unmerged (sample specific)
multiBigwigSummary bins \
    -b ${bw_dir_no_merge}/CLAMP*bw \
    -p 32 \
    -out ${out_dir}/multiBW_NO_MERGE_readCounts_CLAMP.npz

plotPCA -in ${out_dir}/multiBW_NO_MERGE_readCounts_CLAMP.npz \
-o ${out_dir}/multiBW_NO_MERGE_PCA_CLAMP.png \
-T "PCA of read counts (multiBigwig NO MERGE CLAMP)"


### MSL2
# merged samples
multiBigwigSummary bins \
    -b ${bw_dir}/MSL2*bw \
    -p 32 \
    -out ${out_dir}/multiBW_readCounts_MSL2.npz

plotPCA -in ${out_dir}/multiBW_readCounts_MSL2.npz \
-o ${out_dir}/multiBW_PCA_MSL2.png \
-T "PCA of read counts (multiBigwig MERGED MSL2)"

# NO MERGE (sample specific)
multiBigwigSummary bins \
    -b ${bw_dir_no_merge}/MSL2*bw \
    -p 32 \
    -out ${out_dir}/multiBW_NO_MERGE_readCounts_MSL2.npz

plotPCA -in ${out_dir}/multiBW_NO_MERGE_readCounts_MSL2.npz \
-o ${out_dir}/multiBW_NO_MERGE_PCA_MSL2.png \
-T "PCA of read counts (multiBigwig NO MERGE MSL2)"

