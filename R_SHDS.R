# set working directory (omitted for GitHub)
getwd()

# I did the assessment in Python first, and am now re-doing it in R
data <- read_excel("contacts_h1n1_data.xlsx")
head(data, 5)

# check for nulls and na
sum(is.na(data)) # both return 0 i.e. no entries are null or missing
sum(is.null(data))

# calculate overall mean and variance
round(mean(data$contacts), 2) # 6.35
round(var(data$contacts), 2) # 18.69

# occupations
occs <- sort(unique(data$occupation_factor))

# calculate mean and variance per group, using aggregate function
occ_mean <- aggregate(contacts ~ occupation_factor, data, FUN = mean)
occ_mean$contacts <- round(occ_mean$contacts, 2)
occ_var <- aggregate(contacts ~ occupation_factor, data, FUN = var)
occ_var$contacts <- round(occ_var$contacts, 2)

# combine occupation, mean and variance into one table
occ_mean_var <- data.frame(occs, occ_mean$contacts, occ_var$contacts)
colnames(occ_mean_var) <- c("Occupation", "Contact mean", "Contact var")
occ_mean_var

# produce box plot for contacts by occupation
boxplot(data$contacts ~ data$occupation_factor,
        xlab = "Occupation",
        ylab = "Contacts",
        main = "Contact numbers by occupation")
