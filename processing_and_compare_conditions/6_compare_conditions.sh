# This file first calls the deeptools computeMatrix function to get the peaks from the consensus peaks bed files 
# that appear at the genomic positions specified by the bigwig files.
# Then the matrix output is plotted with the deeptools plotHeatmap function.
# A sample output of the heatmaps is included.
# INPUT: bigwig files from 3_bam_to_bigwig.sh 
# and consensus peaks bed files from 5_consensus_peaks_2_of_3_macs2.sh.
# OUTPUT: computeMatrix matrices and plotHeatmap heatmaps.

# Tools and versions: deeptools/3.2.1

genome_dir=/path/to/blacklist/genome
bw_dir=/path/to/bigwig_files
peak_dir=/path/to/consensus_peaks
out_dif=/path/to/out/files

### wildtype compared to other three

# remove header
sed 1d CLAMP_yw_male_2of3_ConsensusPeaks.bed > CLAMP_yw_male_2of3_ConsensusPeaks_clean.bed
sed 1d MSL2_yw_male_2of3_ConsensusPeaks.bed > MSL2_yw_male_2of3_ConsensusPeaks_clean.bed

# computeMatrix
computeMatrix reference-point \
    --referencePoint center \
    --smartLabels \
    -b 1000 -a 1000 \
    --blackListFileName "${genome_dir}/dm6-blacklist.bed" \
    -S "${bw_dir}/CLAMP_yw_male.dedup.bw" \
     "${bw_dir}/CLAMP_deltaH-CyOtwistGFP_male.dedup.bw" \
     "${bw_dir}/CLAMP_deltaH-deltaH_male.dedup.bw" \
     "${bw_dir}/CLAMP_deltaE-deltaE_male.dedup.bw" \
    -R "${peak_dir}/CLAMP_yw_male_2of3_ConsensusPeaks_clean.bed" \
    --skipZeros \
    --missingDataAsZero  \
    --numberOfProcessors 'max' \
    -o "${out_dir}/compare_cond_CLAMP_matrix_2of3.gz"

# plotHeatmap
plotHeatmap -m "${out_dir}/compare_cond_CLAMP_matrix_2of3.gz" \
    -out "${out_dir}/compare_conditions_clamp_yw_2of3.png" \
    --regionsLabel "CLAMP_yw_male.consensus.2_of_3"\
    --samplesLabel "yw" "deltaH-CyOtwistGFP" "deltaH-deltaH" "deltaE-deltaE"\
    --colorMap 'Blues' 'Blues'


# MSL2 antibody, 2 of 3 consensus peaks
# computeMatrix
computeMatrix reference-point \
    --referencePoint center \
    --smartLabels \
    -b 1000 -a 1000 \
    --blackListFileName "${genome_dir}/dm6-blacklist.bed" \
    -S "${bw_dir}/MSL2_yw_male.dedup.bw" \
     "${bw_dir}/MSL2_clampDH-CyOtwistGFP_male.dedup.bw" \
     "${bw_dir}/MSL2_clampDH-clampDH_male.dedup.bw" \
     "${bw_dir}/MSL2_clampDE-clampDE_male.dedup.bw" \
    -R "${peak_dir}/MSL2_yw_male_2of3_ConsensusPeaks_clean.bed" \
    --skipZeros \
    --missingDataAsZero  \
    --numberOfProcessors 'max' \
    -o "${out_dir}/compare_cond_MSL2_matrix_2of3.gz"

# plotHeatmap
plotHeatmap -m "${out_dir}/compare_cond_MSL2_matrix_2of3.gz" \
    -out "${out_dir}/compare_conditions_MSL2_yw_2of3.png" \
    --regionsLabel "MSL2_yw_male.consensus.2_of_3"\
    --samplesLabel "yw" "clampDH-CyOtwistGFP" "clampDH-clampDH" "clampDE-clampDE"\
    --colorMap 'Blues' 'Blues'

    

### deltaH-CyOtwistGFP compared to other three

#  remove header 
sed 1d CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks.bed > CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks_clean.bed 
sed 1d MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks.bed > MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks_clean.bed

# clamp antibody, 2 of 3 consensus peaks
# computeMatrix
computeMatrix reference-point \
    --referencePoint center \
    --smartLabels \
    -b 1000 -a 1000 \
    --blackListFileName "${genome_dir}/dm6-blacklist.bed" \
    -S "${bw_dir}/CLAMP_yw_male.dedup.bw" \
     "${bw_dir}/CLAMP_deltaH-CyOtwistGFP_male.dedup.bw" \
     "${bw_dir}/CLAMP_deltaH-deltaH_male.dedup.bw" \
     "${bw_dir}/CLAMP_deltaE-deltaE_male.dedup.bw" \
    -R "${peak_dir}/CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks_clean.bed" \
    --skipZeros \
    --missingDataAsZero  \
    --numberOfProcessors 'max' \
    -o "${out_dir}/compare_cond_CLAMP_heterozygote_matrix_2of3.gz"

# plotHeatmap
plotHeatmap -m "${out_dir}/compare_cond_CLAMP_heterozygote_matrix_2of3.gz" \
    -out "${out_dir}/compare_conditions_clamp_deltaH-CyOtwistGFP_2of3.png" \
    --regionsLabel "CLAMP_deltaH-CyOtwistGFP_male.consensus.2_of_3"\
    --samplesLabel "yw" "deltaH-CyOtwistGFP" "deltaH-deltaH" "deltaE-deltaE"\
    --colorMap 'Blues' 'Blues'


# MSL2 antibody, 2 of 3 consensus peaks
# computeMatrix
computeMatrix reference-point \
    --referencePoint center \
    --smartLabels \
    -b 1000 -a 1000 \
    --blackListFileName "${genome_dir}/dm6-blacklist.bed" \
    -S "${bw_dir}/MSL2_yw_male.dedup.bw" \
     "${bw_dir}/MSL2_clampDH-CyOtwistGFP_male.dedup.bw" \
     "${bw_dir}/MSL2_clampDH-clampDH_male.dedup.bw" \
     "${bw_dir}/MSL2_clampDE-clampDE_male.dedup.bw" \
    -R "${peak_dir}/MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks_clean.bed" \
    --skipZeros \
    --missingDataAsZero  \
    --numberOfProcessors 'max' \
    -o "${out_dir}/compare_cond_MSL2_heterozygote_matrix_2of3.gz"

# plotHeatmap
plotHeatmap -m "${out_dir}/compare_cond_MSL2_heterozygote_matrix_2of3.gz" \
    -out "${out_dir}/compare_conditions_MSL2_deltaH-CyOtwistGFP_2of3.png" \
    --regionsLabel "MSL2_deltaH-CyOtwistGFP_male.consensus.2_of_3"\
    --samplesLabel "yw" "clampDH-CyOtwistGFP" "clampDH-clampDH" "clampDE-clampDE"\
    --colorMap 'Blues' 'Blues'
