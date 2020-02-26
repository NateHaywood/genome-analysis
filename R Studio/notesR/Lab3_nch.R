library(tidyverse)
SNPs<- read.table("/Users/nate/Desktop/R:Python/R Studio/23andMe_complete.txt", header = TRUE, sep = "\t")

## Exercise 1: Using ggplot make a make a bar graph of the total SNP counts for each chromosome.

barGraph <- ggplot(data = SNPs) + geom_bar(mapping = aes(x = chromosome))
barGraph

## Exercise 2: Order the chromosomes according to number by converting chromosomes from a factor to a order factor as in the example above. Then replot the bar graph

SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))
orderedBarGraph <- ggplot(data = SNPs) + geom_bar(mapping = aes(x = chromosome))
orderedBarGraph

## Exercise 3: Show the contribution of each genotype to the chromosome count using a stacked bar graph (with the fill = genotype)

filledBarGraph <- ggplot(data = SNPs) + geom_bar(mapping = aes(x = chromosome, fill = genotype))
filledBarGraph

## Exercise 4: Make each set of stacked bars the same height to easier to compare proportions across groups.

evenBarGraph <- ggplot(data = SNPs) + geom_bar(mapping = aes(x = chromosome, fill = genotype), position = "fill")
evenBarGraph

## Exercise 5: Now place genotypes directly beside one another for each chromosome to compare individual values.

dodgeBarGraph <- ggplot(data = SNPs) + geom_bar(mapping = aes(x = chromosome, fill = genotype), position = "dodge")
dodgeBarGraph

## Exercise 6: The above graph is pretty hard to read. Try using facet_wrap with the genotype

facetBarGraph <- ggplot(data = SNPs) + geom_bar(mapping = aes(x = chromosome, fill = genotype), position = "dodge") + facet_wrap(~ genotype, nrow = 3)
facetBarGraph
