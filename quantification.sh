#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=4000M
#SBATiCH --time=02:00:00
#SBATCH --job-name=quantification
#SBATCH --mail-user=jules.montuelle@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=/data/courses/rnaseq/lncRNAs/Project1/jules/outputs_and_errors/output_quantification_%j.o
#SBATCH --error=/data/courses/rnaseq/lncRNAs/Project1/jules/outputs_and_errors/error_quantification_%j.e

module add UHTS/Analysis/HTSeq/0.9.1;


BAM=/data/courses/rnaseq/lncRNAs/Project1/jules/hisat2
GTF=/data/courses/rnaseq/lncRNAs/Project1/jules/Stringtie/merged_replicates


for f in `ls $BAM/*.bam`
    do
        htseq-count -f bam ${f} $GTF/meta_assembly.gtf -s no > ${f}.txt
        mv ${f}.txt /data/courses/rnaseq/lncRNAs/Project1/jules/quantification
    done



## Old code:

# for j in 2 4 8 
#     do for i in 1 2 3
#         do htseq-count -f bam $BAM/D_Pt${j}_${i}.bam $GTF/ D_Pt${j}_${i}.gtf --stranded=no --samout=/data/courses/rnaseq/lncRNAs/Project1/jules/quantification/quantification_D_Pt${j}_${i}.sam
#     done
# done

# for i in 1 2 3 
#     do htseq-count -f bam $BAM/A24wt_${i}.bam $GTF/A24wt_${i}.gtf --stranded=no --samout=/data/courses/rnaseq/lncRNAs/Project1/jules/quantification/quantification_A24wt_${i}.sam
# done

# htseq-count -f bam $BAM/A24wt_1.bam $GTF/A24wt_1.gtf --stranded=no --samout=/data/courses/rnaseq/lncRNAs/Project1/jules/quantification/quantification.sam