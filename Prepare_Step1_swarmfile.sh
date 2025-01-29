#!/bin/bash

#Step 1 prepare fastqc swarm file

for f in M*/*fq.gz;
do
echo "module load fastqc && fastqc $f" >> Step1_prep_filter.swarm
done
