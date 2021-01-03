#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATiCH --time=02:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=jules.montuelle@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=/data/courses/rnaseq/lncRNAs/Project1/jules/outputs_and_errors/output_fastqc_%j.o
#SBATCH --error=/data/courses/rnaseq/lncRNAs/Project1/jules/outputs_and_errors/error_fastqc_%j.e

source /data/users/lfalquet/BC7107_20/scripts/module.sh


MERGED=/data/courses/rnaseq/lncRNAs/Project1/michele/fastq/merged_fastq

cd $MERGED

fastqc -o /data/courses/rnaseq/lncRNAs/Project1/jules/fastqc *.fastq.gz

module add UHTS/Analysis/MultiQC/1.8 
multiqc /data/courses/rnaseq/lncRNAs/Project1/jules/fastqc
