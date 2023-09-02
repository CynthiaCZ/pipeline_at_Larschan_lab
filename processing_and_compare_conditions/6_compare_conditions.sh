#!/bin/bash
#SBATCH -J compare_cond
#SBATCH -n 32
#SBATCH --mem=32G
#SBATCH -t 6:00:00
#SBATCH -o /users/czhang91/CnR_2023/logs/compare_cond-%A.out
#SBATCH -e /users/czhang91/CnR_2023/logs/compare_cond-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chengyue_zhang@brown.edu

module load deeptools/3.2.1 python/2.7.12 matplotlib/2.2.4 pysam/0.15.2 py2bit/0.3.0 numpydoc/0.9.1 pybigwig/0.3.15 plotly/3.9.0 deeptoolsintervals/0.1.7

dir=/users/czhang91/CnR_2023
bw_dir=/users/czhang91/CnR_2023/bigwig_files
peak_dir=/users/czhang91/CnR_2023/consensus_peaks/consensus_peaks_2_of_3

###yw compared to other three

#  remove header 
# sed 1d CLAMP_yw_male_2of3_ConsensusPeaks.bed > CLAMP_yw_male_2of3_ConsensusPeaks_clean.bed
# sed 1d MSL2_yw_male_2of3_ConsensusPeaks.bed > MSL2_yw_male_2of3_ConsensusPeaks_clean.bed

# clamp antibody, 2 of 3 consensus peaks
# computeMatrix
computeMatrix reference-point \
    --referencePoint center \
    --smartLabels \
    -b 1000 -a 1000 \
    --blackListFileName "${dir}/genome/dm6-blacklist.bed" \
    -S "${bw_dir}/CLAMP_yw_male.dedup.RPGC.bw" \
     "${bw_dir}/CLAMP_deltaH-CyOtwistGFP_male.dedup.RPGC.bw" \
     "${bw_dir}/CLAMP_deltaH-deltaH_male.dedup.RPGC.bw" \
     "${bw_dir}/CLAMP_deltaE-deltaE_male.dedup.RPGC.bw" \
    -R "${peak_dir}/CLAMP_yw_male_2of3_ConsensusPeaks_clean.bed" \
    --skipZeros \
    --missingDataAsZero  \
    --numberOfProcessors 'max' \
    -o "$dir/deeptools_results/compare_cond_CLAMP_matrix_2of3.RPGC.gz"

# plotHeatmap
plotHeatmap -m "$dir/deeptools_results/compare_cond_CLAMP_matrix_2of3.RPGC.gz" \
    -out "$dir/deeptools_results/compare_conditions_clamp_yw_2of3.RPGC.png" \
    --regionsLabel "CLAMP_yw_male.consensus.2_of_3"\
    --samplesLabel "yw" "deltaH-CyOtwistGFP" "deltaH-deltaH" "deltaE-deltaE"\
    --colorMap 'Blues' 'Blues'


# MSL2 antibody, 2 of 3 consensus peaks
# computeMatrix
computeMatrix reference-point \
    --referencePoint center \
    --smartLabels \
    -b 1000 -a 1000 \
    --blackListFileName "${dir}/genome/dm6-blacklist.bed" \
    -S "${bw_dir}/MSL2_yw_male.dedup.RPGC.bw" \
     "${bw_dir}/MSL2_clampDH-CyOtwistGFP_male.dedup.RPGC.bw" \
     "${bw_dir}/MSL2_clampDH-clampDH_male.dedup.RPGC.bw" \
     "${bw_dir}/MSL2_clampDE-clampDE_male.dedup.RPGC.bw" \
    -R "${peak_dir}/MSL2_yw_male_2of3_ConsensusPeaks_clean.bed" \
    --skipZeros \
    --missingDataAsZero  \
    --numberOfProcessors 'max' \
    -o "$dir/deeptools_results/compare_cond_MSL2_matrix_2of3.RPGC.gz"

# plotHeatmap
plotHeatmap -m "$dir/deeptools_results/compare_cond_MSL2_matrix_2of3.RPGC.gz" \
    -out "$dir/deeptools_results/compare_conditions_MSL2_yw_2of3.RPGC.png" \
    --regionsLabel "MSL2_yw_male.consensus.2_of_3"\
    --samplesLabel "yw" "clampDH-CyOtwistGFP" "clampDH-clampDH" "clampDE-clampDE"\
    --colorMap 'Blues' 'Blues'

# # plotHeatmap with limit on z
# dir=/users/czhang91/CnR_2023

# plotHeatmap -m "$dir/deeptools_results/compare_cond_MSL2_matrix_2of3.RPGC.gz" \
#     -out "$dir/deeptools_results/compare_conditions_MSL2_yw_2of3.RPGC_new2.png" \
#     --regionsLabel "MSL2_yw_male.consensus.2_of_3"\
#     --samplesLabel "yw" "clampDH-CyOtwistGFP" "clampDH-clampDH" "clampDE-clampDE"\
#     --colorMap 'Blues' 'Blues'\
#     --zMin 0 --zMax 15
  

###deltaH-CyOtwistGFP compared to other three

#  remove header 
# sed 1d CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks.bed > CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks_clean.bed 
# sed 1d MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks.bed > MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks_clean.bed

# clamp antibody, 2 of 3 consensus peaks
# computeMatrix
computeMatrix reference-point \
    --referencePoint center \
    --smartLabels \
    -b 1000 -a 1000 \
    --blackListFileName "${dir}/genome/dm6-blacklist.bed" \
    -S "${bw_dir}/CLAMP_yw_male.dedup.RPGC.bw" \
     "${bw_dir}/CLAMP_deltaH-CyOtwistGFP_male.dedup.RPGC.bw" \
     "${bw_dir}/CLAMP_deltaH-deltaH_male.dedup.RPGC.bw" \
     "${bw_dir}/CLAMP_deltaE-deltaE_male.dedup.RPGC.bw" \
    -R "${peak_dir}/CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks_clean.bed" \
    --skipZeros \
    --missingDataAsZero  \
    --numberOfProcessors 'max' \
    -o "$dir/deeptools_results/compare_cond_CLAMP_heterozygote_matrix_2of3.RPGC.gz"

# plotHeatmap
plotHeatmap -m "$dir/deeptools_results/compare_cond_CLAMP_heterozygote_matrix_2of3.RPGC.gz" \
    -out "$dir/deeptools_results/compare_conditions_clamp_deltaH-CyOtwistGFP_2of3.RPGC.png" \
    --regionsLabel "CLAMP_deltaH-CyOtwistGFP_male.consensus.2_of_3"\
    --samplesLabel "yw" "deltaH-CyOtwistGFP" "deltaH-deltaH" "deltaE-deltaE"\
    --colorMap 'Blues' 'Blues'


# MSL2 antibody, 2 of 3 consensus peaks
# computeMatrix
computeMatrix reference-point \
    --referencePoint center \
    --smartLabels \
    -b 1000 -a 1000 \
    --blackListFileName "${dir}/genome/dm6-blacklist.bed" \
    -S "${bw_dir}/MSL2_yw_male.dedup.RPGC.bw" \
     "${bw_dir}/MSL2_clampDH-CyOtwistGFP_male.dedup.RPGC.bw" \
     "${bw_dir}/MSL2_clampDH-clampDH_male.dedup.RPGC.bw" \
     "${bw_dir}/MSL2_clampDE-clampDE_male.dedup.RPGC.bw" \
    -R "${peak_dir}/MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks_clean.bed" \
    --skipZeros \
    --missingDataAsZero  \
    --numberOfProcessors 'max' \
    -o "$dir/deeptools_results/compare_cond_MSL2_heterozygote_matrix_2of3.RPGC.gz"

# plotHeatmap
plotHeatmap -m "$dir/deeptools_results/compare_cond_MSL2_heterozygote_matrix_2of3.RPGC.gz" \
    -out "$dir/deeptools_results/compare_conditions_MSL2_deltaH-CyOtwistGFP_2of3.RPGC.png" \
    --regionsLabel "MSL2_deltaH-CyOtwistGFP_male.consensus.2_of_3"\
    --samplesLabel "yw" "clampDH-CyOtwistGFP" "clampDH-clampDH" "clampDE-clampDE"\
    --colorMap 'Blues' 'Blues'
