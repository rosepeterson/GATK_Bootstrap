# GATK Variant Calling Bootstrap  
#### These scripts prepare swarm files to run GATK Variant Calling Pipeline that bootstraps for non-model organisms 
<pre><code> ./Prepare_Step.sh # Produces Step1_prep_filter.swarm </code></pre> 
#### Example line from module load fastqc && fastqc M_sample/M_sample_1A_HCMMHDSX5_L3_1.fq.gz
#### Submit Step1_prep_filter.swarm 
<pre><code> swarm -f Step1_prep_filter.swarm -t 4 -g 50 —time=10:00:00 </code></pre> 
