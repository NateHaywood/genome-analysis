library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
SNPs <- read_tsv("data/23andMe_complete.txt", skip = 14, col_types = 
                   cols(chromosome = col_factor()))
##str(surveys)
## View(surveys)

## Challenge 1: Using pipes, subset the survey data to include animals collected before 1995 and retain columns year, sex, and weight.
subset1 <- surveys %>% 
  filter(year < 1995) %>% 
  select(year, sex, weight)
## subset1

## Challenge 2: Create a new dataframe with the following criteria: only species ID, and a new column called hindfoot_half where there are no 1/2 hindfood values that are NA or less than 30
subset2 <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  mutate(hindfoot_half= hindfoot_length / 2) %>% 
  filter(hindfoot_half < 30) %>% 
  select(species_id, hindfoot_half)
## subset2

## Challenge 3a: How many animals were caught in each plot_type
count1 = surveys %>% 
  count(plot_type)
## count1

## Challenge 3b: Use group_by() and summarize() to find the mean, min and max hindfoot lenght for each species
subset3 <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>%
  group_by(species_id) %>%
  summarize(min_lenght = min(hindfoot_length), mean_lenght = mean(hindfoot_length), max_lenght = max(hindfoot_length), n = n())
## subset3

## Challenge 3c: What was the heaviest animal each year? Return year, genus, species_id and weight.
subset4 <- surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(year) %>% 
  filter(weight == max(weight)) %>% 
  select(year, genus, species_id, weight)
## subset4

## Challenge 4a: Spread the surveys data frame with year as columns, plot_id as rows, and the number of genera per plot as the values. You will need to summarize before reshaping, and use the function n_distinct() to get the number of unique genera within a particular chunk of data. It’s a powerful function!
subset5 <- surveys %>%
  group_by(plot_id, year) %>%
  summarize(n_genera = n_distinct(genus)) %>%
  spread(year, n_genera)
head(subset5)
## subset5

## Challenge 4b: Now take that data frame and gather() it again, so each row is a unique plot_id by year combination.
subset5 %>%
  gather(year, n_genera, -plot_id)
## subset5

## Challenge 4c: The surveys data set has two measurement columns: hindfoot_length and weight. This makes it difficult to do things like look at the relationship between mean values of each measurement per year in different plot types. Let’s walk through a common solution for this type of problem. First, use gather() to create a dataset where we have a key column called measurement and a value column that takes on the value of either hindfoot_length or weight.
subset6 <- surveys %>%
  gather(measurement, value, hindfoot_length, weight)
## subset6

## Challenge 4d: With this new data set, calculate the average of each measurement in each year for each different plot_type. Then spread() them into a data set with a column for hindfoot_length and weight.
subset6 %>%
  summarize(mean_value = mean(value, na.rm = TRUE)) %>%
  group_by(year, measurement, plot_type) %>%
  spread(measurement, mean_value)
## subset6


## Exercise 1: Subset (select) the 23andMe Complete table to just position and genotype
subset7 <- SNPs %>%
  select(position, genotype)
## subset7

## Exercise 2: Filter to just the MT chromosome and remove genotypes A and T.
subset8 <- SNPs %>%
  filter(chromosome == "MT", genotype != "A", genotype != "T")
## subset8

## Exercise 3: Use group_by() and summarize() to find the min positon, max position and total number of positions for each chromosomes.
subset9 <- SNPs %>%
  group_by(chromosome) %>%
  summarize(min_position = min(position), max_position = max(position), n = n())
## subset9

## Exercise 4: Building on ex3 create using mutate a new column with the density of SNPs for each chromosome based the max position - min position divide by the total number of SNPs
subset10 <- subset9 %>%
  mutate(SNP_density = (max_position - min_position) / n)
subset10

## Exercise 5: Building on ex3 sort chromosomes based on SNP density.
subset11 <- subset10 %>%
  arrange(SNP_density)
subset11

## Exercise 6: Export the above table as a csv file to your data directory (There will be no results except the code to show me). However you will get an error when knitting if the code is not correct.
write_csv(subset11, path = "data/densityArrangedTable.csv")
