#!/usr/bin/env bash

#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=2000M
#SBATiCH --time=02:00:00
#SBATCH --job-name=merge
#SBATCH --mail-user=jules.montuelle@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=/home/jmontulle/output_lane_merging_%j.o
#SBATCH --error=/home/jmontuelle/error_lane_merging_%j.e

dir=/data/courses/rnaseq/lncRNAs/Project1/fastq
output=/data/courses/rnaseq/lncRNAs/Project1/jules/merged

cat $dir/A24wt_2_L1_R1_001_MUKRfH9CF6Bl.fastq.gz $dir/A24wt_2_L2_R1_001_7vshjU1iK18t.fastq.gz > $output/A24wt_2_R1.fastq.gz
cat $dir/A24wt_2_L1_R2_001_688o8gPspUup.fastq.gz $dir/A24wt_2_L2_R2_001_1jau0qd9sxfB.fastq.gz > $output/A24wt_2_R2.fastq.gz
cat $dir/A24wt_3_L1_R1_001_g1xUxT9n0p0f.fastq.gz $dir/A24wt_3_L2_R1_001_h2iMBHBykVrS.fastq.gz > $output/A24wt_3_R1.fastq.gz
cat $dir/A24wt_3_L1_R2_001_flKeAMf8I8Fz.fastq.gz $dir/A24wt_3_L2_R2_001_iidJO0IDncvC.fastq.gz > $output/A24wt_3_R2.fastq.gz
cat $dir/A24wt_L1_R1_001_RDviaABMUWPd.fastq.gz $dir/A24wt_L2_R1_001_AGSAlXRAJXMo.fastq.gz > $output/A24wt_1_R1.fastq.gz
cat $dir/A24wt_L1_R2_001_WgZDlT4XFpgi.fastq.gz $dir/A24wt_L2_R2_001_ds15xQFFVOUE.fastq.gz > $output/A24wt_1_R2.fastq.gz

cat $dir/D_Pt2_1_L1_R1_001_oQvI0UidbKEk.fastq.gz $dir/D_Pt2_1_L2_R1_001_ZfVVSwqb15Bv.fastq.gz > $output/D_Pt2_1_R1.fastq.gz
cat $dir/D_Pt2_1_L1_R2_001_MQVnjkYuCHMM.fastq.gz $dir/D_Pt2_1_L2_R2_001_rwav281OeP9b.fastq.gz > $output/D_Pt2_1_R2.fastq.gz
cat $dir/D_Pt2_2_L1_R1_001_hxC1rheMmG9A.fastq.gz $dir/D_Pt2_2_L2_R1_001_Uu736AEIGhzX.fastq.gz > $output/D_Pt2_2_R1.fastq.gz
cat $dir/D_Pt2_2_L1_R2_001_O9B5RJ3j7Qa0.fastq.gz $dir/D_Pt2_2_L2_R2_001_8Im0jBsyM1rw.fastq.gz > $output/D_Pt2_2_R2.fastq.gz
cat $dir/D_Pt2_3_L1_R1_001_asOapN24uyJV.fastq.gz $dir/D_Pt2_3_L2_R1_001_PNJj7XRMnYkJ.fastq.gz > $output/D_Pt2_3_R1.fastq.gz
cat $dir/D_Pt2_3_L1_R2_001_CWlZoiZLXYsL.fastq.gz $dir/D_Pt2_3_L2_R2_001_qHJhr0triorz.fastq.gz > $output/D_Pt2_3_R2.fastq.gz

cat $dir/D_Pt4_1_L1_R1_001_6zmMw3uKWrhn.fastq.gz $dir/D_Pt4_1_L2_R1_001_l8B9ge5gHALC.fastq.gz > $output/D_Pt4_1_R1.fastq.gz
cat $dir/D_Pt4_1_L1_R2_001_fJd5szBqxdgQ.fastq.gz $dir/D_Pt4_1_L2_R2_001_Vnn6bfEr1azB.fastq.gz > $output/D_Pt4_1_R2.fastq.gz
cat $dir/D_Pt4_2_L1_R1_001_DYrw9g4Uii8c.fastq.gz $dir/D_Pt4_2_L2_R1_001_brDaqvEflT9r.fastq.gz > $output/D_Pt4_2_R1.fastq.gz
cat $dir/D_Pt4_2_L1_R2_001_bicRRA2VIqAS.fastq.gz $dir/D_Pt4_2_L2_R2_001_9MJ3whVADGH3.fastq.gz > $output/D_Pt4_2_R2.fastq.gz
cat $dir/D_Pt4_3_L1_R1_001_M80U5szAfELF.fastq.gz $dir/D_Pt4_3_L2_R1_001_hZIhonZNjrmQ.fastq.gz > $output/D_Pt4_3_R1.fastq.gz
cat $dir/D_Pt4_3_L1_R2_001_6hAElRnmWems.fastq.gz $dir/D_Pt4_3_L2_R2_001_QsdxQAG7oMgg.fastq.gz > $output/D_Pt4_3_R2.fastq.gz

cat $dir/D_Pt8_1_L1_R1_001_cBdkkM1a4NM1.fastq.gz $dir/D_Pt8_1_L2_R1_001_SKQBEBqC8n0v.fastq.gz > $output/D_Pt8_1_R1.fastq.gz
cat $dir/D_Pt8_1_L1_R2_001_2fyK3yQf00bW.fastq.gz $dir/D_Pt8_1_L2_R2_001_H112qEf1gAj1.fastq.gz > $output/D_Pt8_1_R2.fastq.gz
cat $dir/D_Pt8_2_L1_R1_001_kUGLvevXq3Nr.fastq.gz $dir/D_Pt8_2_L2_R1_001_rTws7kGi4xge.fastq.gz > $output/D_Pt8_2_R1.fastq.gz
cat $dir/D_Pt8_2_L1_R2_001_Y24wqshAaCR4.fastq.gz $dir/D_Pt8_2_L2_R2_001_OaKDcIVIpLtb.fastq.gz > $output/D_Pt8_2_R2.fastq.gz
cat $dir/D_Pt8_3_L1_R1_001_f3fAjty5N6Fv.fastq.gz $dir/D_Pt8_3_L2_R1_001_rW3UHnDzTfvm.fastq.gz > $output/D_Pt8_3_R1.fastq.gz
cat $dir/D_Pt8_3_L1_R2_001_0ptgXPsucI0k.fastq.gz $dir/D_Pt8_3_L2_R2_001_8jcR6ss0e1Rx.fastq.gz > $output/D_Pt8_3_R2.fastq.gz 