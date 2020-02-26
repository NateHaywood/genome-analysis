## Exercise 1: Add, subtract, multipy and divide the following two vectors (1,3,6,9,12) and (1,0,1,0,1)

v1 <- c(1,3,6,9,12)
v2 <- c(1,0,1,0,1)

sum = v1+v2
diff = v1-v2
prod = v1*v2
quot = v1/v2

## Exercise 2: Create 3 different vectors from (0,1,2,3), (“aa”,“bb”,“cc”,“dd”) and (“aa”,1,“bb”,2). Use str() to determine what data types each vector holds.

temp1 <- c(0,1,2,3)
temp2 <- c("aa", "bb", "cc", "dd")
temp3 <- c("aa", 1, "bb", 2)

str(temp1)
str(temp2)
str(temp3)

## Exercise 3: Create a matrix of the data: genotype 1 (“AA”, “AA”, “AG”, “GG”, “GG”), genotype 2 (“AA”, “AA”, “GG”, “GG”, “GG”). Display the matrix. Use the table function (as in the above examples) to show the total number of each genotype.

genotype1 <- c("AA", "AA", "AG", "GG", "GG")
genotype2 <- c("AA", "AA", "GG", "GG", "GG")
matr <- rbind(genotype1, genotype2)
matr
table(matr)

## Exercise 4: Create a dataframe of the following experiment in samples were collected every 2 minutes starting at t = 0. treatment 1 (0,1,2,3,4), treatment 2 (0,2,4,6,8), treatment 3 (0,3,6,9,12). Display the dataframe. Plot treatment 3 vs. time (you will need to load time as a column rather than a row name)

Time <- c(0,2,4,6,8)
Treatment1 <- c(0,1,2,3,4)
Treatment2 <- c(0,2,4,6,8)
Treatment3 <- c(0,3,6,9,12) 
df = data.frame(Treatment1, Treatment2, Treatment3, row.names = Time)
df

plot(df$Treatment3, Time)

## Exercise 5: Following the example above with the truncated file use read.table to import the full SNP file 23andME_complete.txt. (This is a large file and may take several minutes to load into R) What object type is chromosome? Why is it different from the above SNP_table example with the truncated file?
table1 <- read.table("23andMe_complete.txt", header = TRUE, sep = "\t", row.names = 1)
str(table1)
table2 <- read.table("23andMe_example_cat25.txt", header = TRUE, sep = "\t", row.names = 1)
str(table2)
## The difference between the two chromosome types is the number of levels in each factor.

## Exercise 6: Make a table with the total number of each genotype. There may be unsual genotypes. 23andMe reports a very small number of deletions and insertions coded as D DD DI I II. The double dash – represents an uncertain (not reported) call at this position.
table(table1$genotype)

## Exercise 7: Determine which chromosome(s) the single letter genotype A is found on (e.g which chromosomes have only one copy of DNA)? Hint: Use subset() to make a table with just the genotype A.
Genotype_A <- subset(table1, genotype == 'A')
