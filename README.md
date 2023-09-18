<!-- TABLE OF CONTENTS -->
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About the Project</a>
      <ul>
        <li><a href="#workflow-chart">Workflow Chart</a></li>
        <li><a href="#code-and-output">Code and Output</a></li>
        <li><a href="#tools-and-versions">Tools and Versions</a></li>
      </ul>
    </li>
    <li>
      <a href="#sections">Sections</a>
      <ul>
        <li><a href="#processing-and-compare-conditions">Processing and Compare Conditions</a></li>
        <li><a href="#pca">PCA</a></li>
        <li><a href="#motif-calling">Motif Calling</a></li>
        <li><a href="#differential-peak-analysis">Differential Peak Analysis</a></li>
        <li><a href="#RNA-seq-CUT&RUN-compare">RNA-seq CUT&RUN compare</a></li>
      </ul>
    </li>
    <li><a href="#summary-and-acknowledgments">Summary and Acknowledgments</a></li>
  </ol>



<!-- ABOUT THE PROJECT -->
## About The Project
### Workflow Chart
![Workflow][workflow_chart]

### Code and Output
* Each code file has a number in its file name. That number refers to the step number in the workflow chart
* Since the data that is being used here is unpublished, the in and out file paths are simply place holders
* Sample outputs, e.g. plots are included in each section folder



### Tools and Versions

The project uses the following tools and packages:

* java/jdk-17.0.2
* python/2.7.12
* matplotlib/2.2.4
* [Picard 2.9.2](https://broadinstitute.github.io/picard/)
* [deeptools/3.2.1](https://github.com/deeptools/deepTools)
* [MACS2/2.2.6](https://hbctraining.github.io/Intro-to-ChIPseq/lessons/05_peak_calling_macs.html)
* [MSPC/6.0.1](https://genometric.github.io/MSPC/)
* [bedtools/2.26.0](https://bedtools.readthedocs.io/en/latest/)
* [meme/5.0.5](https://meme-suite.org/meme/tools/meme)
* [memesuite/5.5.4](https://meme-suite.org/meme/)
* [homer/4.10](http://homer.ucsd.edu/homer/motif/)

<!-- SECTIONS -->
## Sections
Each section, as shown by the colored rectangles in the workflow chart above, contains one or several steps. The number in the file names at each step refers to the step number in the workflow chart.
For a more complete description of what each code file does, please refer to the comment block at the beginning of each script.

### Processing and Compare Conditions
<ul>
  <li> 1_bam_dedup_unmerged.sh: uses Picard MarkDuplicates to remove duplicates from UNMERGED bam files </li>
  <li> 2_bam_dedup_merged.sh: uses Picard MarkDuplicates to remove duplicates from MERGED bam files </li>
  <li> 3_bam_to_bigwig.sh: uses deepTools bamCoverage to convert bam files to bigwig files </li>
  <li> 4_macs2_call_peaks.sh: uses MACS2 callpeak function to identify peaks from bam files </li>
  <li> 5_consensus_peaks_2_of_3_macs2.sh: uses MSPC to get consensus peaks that are shared by 2 out of 3 replicates </li>
  <li> 6_compare_conditions.sh: calls deepTools computeMatrix to get the peaks from the consensus peaks bed files that appear at the genomic positions specified by the bigwig files.
  Then plots the matrix output with the deepTools plotHeatmap function. </li> 
  <ul>
    <li> 6a_heatmap_example.png: example output of 6_compare_conditions.sh </li> 
    <li> 6b_heatmap_example_ChrX_vs_autosome.png: example output of 6_compare_conditions.sh </li> 
  </ul>
</ul>

### PCA
<ul>
  <li> 7_plot_PCA.sh: calls deepTools multiBamSummary and multiBigwigSummary. Then uses plotPCA to visualize the results
    <ul>
    <li> 7a_PCA_by_sample.png: example output of 7_plot_PCA.sh </li> 
    <li> 7b_PCA_by_condition.png: example output of 7_plot_PCA.sh </li> 
  </ul>
</ul>

### Motif Calling
<ul>
  <li> 8_separate_X.sh: uses grep to separate chromosome X and autosomes in bed files </li>
  <li> 9.1_get_fasta_for_meme.sh: uses bedtools to convert bed files to fasta files </li>
  <li> 9.2_meme.sh: uses MEME to identify top 100 reoccurring motifs </li>
    <ul>
    <li> 9a_meme_motif_example.png: part of example html output of 9.3_meme.sh </li> 
  </ul>
  <li> 10_streme.sh: uses STREME to identify top 100 reoccurring motifs </li>
    <ul>
    <li> 10a_streme_motif_example.png: part of example html output of 10_streme.sh </li> 
  </ul>
  <li> 11_homer.sh: uses HOMER to identify top 100 reoccurring motifs </li>
  <ul>
    <li> 11a_homer_motif_example.png: part of example html output of 11_homer.sh </li> 
  </ul>
</ul>

### Differential Peak Analysis
<ul>
  <li> 12_DiffBind.Rmd: uses DiffBind to compute differentially bound sites of pairs of conditions </li>
    <ul>
    <li> 12a_diffbind_input_config.csv: configuration file with file handles
    <li> 12b_volcano_plot_example.png: example output of 12_DiffBind.sh </li> 
  </ul>
  <li> 10_streme.sh: uses STREME to identify top 100 reoccurring motifs </li>
    <ul>
    <li> 10a_streme_motif_example.png: part of example html output of 10_streme.sh </li> 
  </ul>
  <li> 11_homer.sh: uses HOMER to identify top 100 reoccurring motifs </li>
  <ul>
    <li> 11a_homer_motif_example.png: part of example html output of 11_homer.sh </li> 
  </ul>
</ul>

### RNA-seq CUT&RUN compare
Input: \
Code Files: \
Output: 


<!-- SUMMARY -->
## Summary and Acknowledgments


<!-- MARKDOWN LINKS & IMAGES -->
[workflow_chart]: ./workflow_chart.png

