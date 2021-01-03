#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=4000M
#SBATiCH --time=02:00:00
#SBATCH --job-name=stringtie--merge_metafile
#SBATCH --mail-user=jules.montuelle@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=/data/courses/rnaseq/lncRNAs/Project1/jules/outputs_and_errors/output_stringtie--merge_metafile_%j.o
#SBATCH --error=/data/courses/rnaseq/lncRNAs/Project1/jules/outputs_and_errors/error_stringtie--merge_metafile_%j.e


STRING_TIE_DIR=/data/courses/rnaseq/lncRNAs/Project1/jules/Stringtie/merged_replicates
REF=/data/courses/rnaseq/lncRNAs/Project1/references/annotation_gtf


cd $STRING_TIE_DIR

stringtie --merge -p 8 -G $REF/gencode.v35.annotation.gtf -o $STRING_TIE_DIR/meta_assembly.gtf $STRING_TIE_DIR/mergedlist.txt
