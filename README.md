# GATK Variant Calling Bootstrap  
##### These scripts prepare swarm files to run GATK Variant Calling Pipeline that bootstraps for non-model organisms 
#### Step 1 Run FastQC
<pre><code> ./Prepare_Step1.sh # Produces Step1_prep_filter.swarm </code></pre> 
##### Example line from Step1_prep_filter.swarm:  module load fastqc && fastqc M_sample/M_sample_1A_HCMMHDSX5_L3_1.fq.gz
#### Submit Step1_prep_filter.swarm 
<pre><code> swarm -f Step1_prep_filter.swarm -t 4 -g 50 —time=10:00:00 </code></pre> 
#### Step 2 Run Trimmomatic
<pre><code> ./Prepare_Step2.sh # Produces Step2_trimommatic.swarm </code></pre> 
##### Example line from Step2_trimommatic.swarm: java -jar /usr/local/apps/trimmomatic/0.39/trimmomatic-0.39.jar PE -threads 16 M_sample/M_sample_R1.fastq.gz M_sample/M_sample_R2.fastq.gz M_sample/M_sample_matched_R1.fastq.gz M_sample/M_sample_unmatched_R1.fastq.gz M_sample/M_sample_matched_R2.fastq.gz M_sample/M_sample_unmatched_R2.fastq.gz ILLUMINACLIP:/usr/local/apps/trimmomatic/Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:31
#### Submit Step2_trimommatic.swarm
<pre><code> swarm -f Step2_trimommatic.swarm --time=10:00:00 -t 16 -g 50 --module trimmomatic </code></pre> 
