#BiocManager::install('EnhancedVolcano')
#BiocManager::install("biomaRt")

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
write.csv(as.data.frame(resSig), file = 'candidate_genes.csv')

EnhancedVolcano(res,
                lab = rownames(res),
                x = 'log2FoldChange',
                y = 'pvalue',
                title = 'wt versus treated',
                pCutoff = 10e-32,
                FCcutoff = 0.5,
                pointSize = 3.0,
                labSize = 6.0)

EnhancedVolcano(res,
                lab = rownames(res),
                x = 'log2FoldChange',
                y = 'pvalue',
                xlab = bquote(~Log[2]~ 'fold change'),
                selectLab = c("MSTRG.10253", "MSTRG.10914", "MSTRG.12037", "MSTRG.1338", 
                              "MSTRG.13997", "MSTRG.17375", "MSTRG.17637", "MSTRG.1829", 
                              "MSTRG.19268", "MSTRG.19721", "MSTRG.20163", "MSTRG.21026"),
                pCutoff = 10e-32,
                FCcutoff = 0.5,
                pointSize = 2.0,
                labSize = 4.0,
                title = 'wt versus treated',
                labCol = 'black',
                labFace = 'bold',
                boxedLabels = TRUE,
                colAlpha = 0.5,
                legendLabels=c('Not sig.','Log (base 2) FC','p-value',
                               'p-value & Log (base 2) FC'),
                legendLabSize = 14,
                legendIconSize = 4.0,
                drawConnectors = TRUE,
                lengthConnectors = unit(5, 'points'),
                typeConnectors = "open",
                widthConnectors = .1,
                colConnectors = 'black')

col <- c('skyblue', 'red2', 'red3', 'red4')
candidates <- c("MSTRG.10253", "MSTRG.10914", "MSTRG.12037", "MSTRG.1338", 
                "MSTRG.13997", "MSTRG.17375", "MSTRG.17637", "MSTRG.1829", 
                "MSTRG.19268", "MSTRG.19721", "MSTRG.20163", "MSTRG.21026")
gene_name <- c("EMP2", "MSTRG.10914 (Unkown)", "SLFN11", "RAB3B", "PRDX2", "APCDD1L-DT",
               "CBR1", "SORT1", "TEX55", "PPM1L", "AFAP1-AS1", "FSTL5")

par(mfrow=c(3, 4), mar=c(3,3,3,1))

for (x in 1:12) {
  plotCounts(dds, candidates[x], intgroup="condition", col = c(rep(col, each = 3)), pch = 19, main = gene_name[x])
}

par(mfrow=c(1,1))
GAS5 <- as.data.frame(plotCounts(dds, "MSTRG.2526", intgroup="condition", returnData = T))
meanwt <- mean(GAS5$count[1:3])
meanpt2 <- mean(GAS5$count[4:6])
meanpt4 <- mean(GAS5$count[7:9])
meanpt8 <- mean(GAS5$count[10:12])

plotCounts(dds, "MSTRG.2526", intgroup="condition", 
           col = c(rep(col, each = 3)), pch = 19, main = "GAS5")

boxplot(GAS5$count[1:3], GAS5$count[4:6], GAS5$count[7:9], GAS5$count[10:12], 
        main = "GAS5 as a proof of concept", col = col, names = c("A24wt", "D_Pt2", "D_Pt4", "D_Pt8"), boxwex = 0.5)
