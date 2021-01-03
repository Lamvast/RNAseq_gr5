#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=25000M
#SBATiCH --time=02:00:00
#SBATCH --job-name=hisat
#SBATCH --mail-user=jules.montuelle@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=/data/courses/rnaseq/lncRNAs/Project1/jules/outputs_and_errors/output_hisat_%j.o
#SBATCH --error=/data/courses/rnaseq/lncRNAs/Project1/jules/outputs_and_errors/error_hisat_%j.e


module add UHTS/Aligner/hisat/2.2.1;
module add UHTS/Analysis/samtools/1.10

DIR=/data/courses/rnaseq/lncRNAs/Project1/jules/hisat2

mkdir -p ${DIR}

HISAT2_INDEXES=/data/courses/rnaseq/lncRNAs/Project1/references/hisat_index

cd /data/courses/rnaseq/lncRNAs/Project1/matthieu/fastq_merged

for j in 2 4 8 
do for i in 1 2 3
do hisat2 -p 4 --dta -x $HISAT2_INDEXES/hg38 -1 D_Pt${j}_${i}_R1* -2  D_Pt${j}_${i}_R2* -S $DIR/D_Pt${j}_${i}.sam
samtools sort -@ 8 -o $DIR/D_Pt${j}_${i}.bam $DIR/D_Pt${j}_${i}.sam
rm $DIR/*.sam
done
done

for i in 1 2 3 
do hisat2 -p 4 --dta -x $HISAT2_INDEXES/hg38 -1 A24wt_${i}_R1* -2  A24wt_${i}_R2* -S $DIR/A24wt_${i}.sam
samtools sort -@ 8 -o $DIR/A24wt_${i}.bam $DIR/A24wt_${i}.sam
rm $DIR/*.sam
done
