#BiocManager::install('EnhancedVolcano')

devtools::install_github('kevinblighe/EnhancedVolcano')
library(EnhancedVolcano)
library(ggplot2)
library(ggrepel)
library('DESeq2')

directory <- "C:/Users/Jules/Downloads/quantification"

sampleFiles <- grep("*.txt", list.files(directory), value = TRUE)
sampleCondition <- c("A24wt", "A24wt", "A24wt", "D_Pt2", "D_Pt2", "D_Pt2", "D_Pt4", "D_Pt4", "D_Pt4", "D_Pt8", "D_Pt8", "D_Pt8")
sampleTable <- data.frame(sampleName = sampleFiles, fileName = sampleFiles, condition = sampleCondition)

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design = ~ condition)

keep <- rowSums(counts(ddsHTSeq)) >= 10
dds <- ddsHTSeq[keep,]

dds$condition <- relevel(dds$condition, ref = "A24wt")

dds <- DESeq(dds, test="LRT", reduced = ~1)
res <- results(dds)

resOrdered <- res[order(res$pvalue),]
summary(res)

sum(res$padj < 0.1, na.rm=TRUE)
plotMA(res, ylim=c(-2,2))

resSig <- subset(resOrdered, padj < 0.1)
write.csv(as.data.frame(resSig), file = 'significant_de_genes.csv')

EnhancedVolcano(res,
                lab = rownames(res),
                x = 'log2FoldChange',
                y = 'pvalue',
                title = 'wt versus treated',
                pCutoff = 10e-32,
                FCcutoff = 0.5,
                pointSize = 3.0,
                labSize = 6.0)



