#!/usr/bin/env bash

#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=2000M
#SBATiCH --time=02:00:00
#SBATCH --job-name=count
#SBATCH --mail-user=jules.montuelle@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=/home/jmontuelle/output_counting_%j.o
#SBATCH --error=/home/jmontuelle/error_counting_%j.e

MERGED=/data/courses/rnaseq/lncRNAs/Project1/jules/merged/


for files in $MERGED*.fastq.gz; 
do file_name=$(basename -s .fastq.gz $files);
zcat $files | awk '/@/{x++} END{print x, "Reads for", $file_name}'; # $file_name doesn't give the right name
done >> /data/courses/rnaseq/lncRNAs/Project1/jules/counts.txt


