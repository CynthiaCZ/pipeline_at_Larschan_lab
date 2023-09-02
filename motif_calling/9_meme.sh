#!/bin/bash
#SBATCH -J meme
#SBATCH -n 32
#SBATCH --mem=16G
#SBATCH -t 12:00:00
#SBATCH -o /users/czhang91/CnR_2023/logs/meme-%A.out
#SBATCH -e /users/czhang91/CnR_2023/logs/meme-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chengyue_zhang@brown.edu

# module load meme/5.0.5
# dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

# meme ${dir}/CLAMP_yw_male_2of3_ConsensusPeaks.autosomes.fa.out -dna \
#     -oc ${dir}/CLAMP_yw_male_2of3_autosomes_100 \
#     -nostatus -time 14400 \
#     -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 32


# module load meme/5.0.5
# dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

# meme ${dir}/CLAMP_yw_male_2of3_ConsensusPeaks.chrX.fa.out -dna \
#     -oc ${dir}/CLAMP_yw_male_2of3_chrX_100 \
#     -nostatus -time 14400 \
#     -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 32

# module load meme/5.0.5
# dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

# meme ${dir}/MSL2_yw_male_2of3_ConsensusPeaks.autosomes.fa.out -dna \
#     -oc ${dir}/MSL2_yw_male_2of3_autosomes_100 \
#     -nostatus -time 14400 \
#     -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
    
# module load meme/5.0.5
# dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

# meme ${dir}/MSL2_yw_male_2of3_ConsensusPeaks.chrX.fa.out -dna \
#     -oc ${dir}/MSL2_yw_male_2of3_chrX_100 \
#     -nostatus -time 14400 \
#     -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31


##### CLAMP #####

module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/CLAMP_deltaE-deltaE_male_2of3_ConsensusPeaks.autosomes.fa.out -dna \
    -oc ${dir}/CLAMP_deltaE-deltaE_male_2of3_autosomes_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
    
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/CLAMP_deltaE-deltaE_male_2of3_ConsensusPeaks.chrX.fa.out -dna \
    -oc ${dir}/CLAMP_deltaE-deltaE_male_2of3_chrX_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31



module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks.autosomes.fa.out -dna \
    -oc ${dir}/CLAMP_deltaH-CyOtwistGFP_male_2of3_autosomes_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
    
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks.chrX.fa.out -dna \
    -oc ${dir}/CLAMP_deltaH-CyOtwistGFP_male_2of3_chrX_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
    
  
    
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/CLAMP_deltaH-deltaH_male_2of3_ConsensusPeaks.autosomes.fa.out -dna \
    -oc ${dir}/CLAMP_deltaH-deltaH_male_2of3_autosomes_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
    
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/CLAMP_deltaH-deltaH_male_2of3_ConsensusPeaks.chrX.fa.out -dna \
    -oc ${dir}/CLAMP_deltaH-deltaH_male_2of3_chrX_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31



##### MSL #####

module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/MSL2_clampDE-clampDE_male_2of3_ConsensusPeaks.autosomes.fa.out -dna \
    -oc ${dir}/MSL2_clampDE-clampDE_male_2of3_autosomes_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
    
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/MSL2_clampDE-clampDE_male_2of3_ConsensusPeaks.chrX.fa.out -dna \
    -oc ${dir}/MSL2_clampDE-clampDE_male_2of3_chrX_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
  
  
  
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/MSL2_clampDH-clampDH_male_2of3_ConsensusPeaks.autosomes.fa.out -dna \
    -oc ${dir}/MSL2_clampDH-clampDH_male_2of3_autosomes_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
    
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/MSL2_clampDH-clampDH_male_2of3_ConsensusPeaks.chrX.fa.out -dna \
    -oc ${dir}/MSL2_clampDH-clampDH_male_2of3_chrX_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
 
 
 
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks.autosomes.fa.out -dna \
    -oc ${dir}/MSL2_clampDH-CyOtwistGFP_male_2of3_autosomes_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
    
module load meme/5.0.5
dir=/users/czhang91/CnR_2023/consensus_2of2_FASTA_XvsA

meme ${dir}/MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks.chrX.fa.out -dna \
    -oc ${dir}/MSL2_clampDH-CyOtwistGFP_male_2of3_chrX_100 \
    -nostatus -time 14400 \
    -mod zoops -nmotifs 100 -minw 6 -maxw 50 -objfun classic -revcomp -markov_order 0 -p 31
  
    
# CLAMP_deltaE-deltaE_male_2of3_ConsensusPeaks.autosomes.fa.out
# CLAMP_deltaE-deltaE_male_2of3_ConsensusPeaks.chrX.fa.out
# CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks.autosomes.fa.out
# CLAMP_deltaH-CyOtwistGFP_male_2of3_ConsensusPeaks.chrX.fa.out
# CLAMP_deltaH-deltaH_male_2of3_ConsensusPeaks.autosomes.fa.out
# CLAMP_deltaH-deltaH_male_2of3_ConsensusPeaks.chrX.fa.out
# # CLAMP_yw_male_2of3_autosomes_100
# # CLAMP_yw_male_2of3_chrX_100
# CLAMP_yw_male_2of3_ConsensusPeaks.autosomes.fa.out
# CLAMP_yw_male_2of3_ConsensusPeaks.chrX.fa.out
# MSL2_clampDE-clampDE_male_2of3_ConsensusPeaks.autosomes.fa.out
# MSL2_clampDE-clampDE_male_2of3_ConsensusPeaks.chrX.fa.out
# MSL2_clampDH-clampDH_male_2of3_ConsensusPeaks.autosomes.fa.out
# MSL2_clampDH-clampDH_male_2of3_ConsensusPeaks.chrX.fa.out
# MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks.autosomes.fa.out
# MSL2_clampDH-CyOtwistGFP_male_2of3_ConsensusPeaks.chrX.fa.out
# # MSL2_yw_male_2of3_ConsensusPeaks.autosomes.fa.out
# # MSL2_yw_male_2of3_ConsensusPeaks.chrX.fa.out