## visualize assembly

# https://cran.r-project.org/web/packages/pafr/vignettes/Introduction_to_pafr.html
library(pafr)
library(ggplot2)
library(gridExtra)

setwd("/Users/madag/Projects/PhD/github/decoil-paper/celllines/chp212")

paffile1 <- "hg38_decoil.paf"
ali <- read_paf(paffile1)
p1 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="decoil")  + theme_bw()

paffile2 <- "hg38_shasta.paf"
ali <- read_paf(paffile2)
p2 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="shasta")  + theme_bw()

paffile3 <- "hg38_paper.paf"
ali <- read_paf(paffile3)
p3 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="helmsauer_etal_2020")  + theme_bw()


grid.arrange(p1, p2, p3, nrow=1)


paffile <- system.file("extdata", "fungi.paf", package="pafr")
paffile <- "/Volumes/henssen_lab/work/evolution/assembly/K7-23273_initial_relapse.paf"

  paffile <- "/home/mada/Projects/henssen_lab/Simulation/data/process/test/test.paf"
  ali <- read_paf(paffile)
  p1 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="test (AC)")  + theme_bw()
  
  paffile <- "/home/mada/Projects/henssen_lab/Simulation/data/process/A/test/test1.paf"
  ali <- read_paf(paffile)
  p2 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="AnC") + theme_bw()
  
  grid.arrange(p1, p2, nrow = 2)

paffile <- "/home/mada/Projects/henssen_lab/Simulation/data/process/AC/asm-to-ref.paf"
ali <- read_paf(paffile)
dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="circular reference")  + theme_bw()  


paffile <- "/home/mada/Projects/henssen_lab/Simulation/data/process/A/ref-to-ref.paf"
ali <- read_paf(paffile)
p1 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="circular reference")  + theme_bw()

paffile <- "/home/mada/Projects/henssen_lab/Simulation/data/process/A/asm-to-ref.paf"
ali <- read_paf(paffile)
p2 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="assembly") + theme_bw()

paffile <- "/home/mada/Projects/henssen_lab/Simulation/data/process/ACnDE/reads-to-ref.paf"
ali <- read_paf(paffile)
p3 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="cir reference ACnDE")  + theme_bw()

paffile <- "/home/mada/Projects/henssen_lab/Simulation/data/process/ACnDE/asm-to-ref.paf"
ali <- read_paf(paffile)
p4 <- dotplot(ali, label_seqs=TRUE, alignment_colour="blue", ylab="hg38", xlab="assembly ACnDE") + theme_bw()

grid.arrange(p1, p2, p3, p4, nrow = 2)




paffile <- "/home/mada/Projects/henssen_lab/Simulation/data/process/ACnDE/asm-to-ref.paf"
ali <- read_paf(paffile)
plot_synteny(ali, q_chrom="circle3", t_chrom="chr2:5000000-5130000", centre=TRUE) +
  theme_bw()

plot_synteny(long_ali, q_chrom="4", t_chrom="chr2:15000000-16800000", centre=TRUE) +
  theme_bw()

plot_synteny(long_ali, q_chrom="6", t_chrom="chr2:15000000-16800000", centre=TRUE) +
  theme_bw()

plot_synteny(long_ali, q_chrom="10", t_chrom="chr2:15000000-16800000", centre=TRUE) +
  theme_bw()
