# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
# use read.csv()

GSS_sub <- read.csv("C:/Users/HYH/Desktop/WINTER 2015/R_programming/GSS_subset7212.csv")

# 2. Peek at the top few rows
head(GSS_sub, 5)
## head(GSS_sub)

# 3. Peek at the top few rows for only a few columns
GSS_sub[1:5, c(3:6)]
## head(GSS_sub[1:5])  one-dimensional like a list

# 4. How many rows does your data have?
summary(GSS_sub)
range(GSS_sub) # 57061 in total
## nrow(GSS_sub)

# 5. Get a summary for every column
summary(GSS_sub)

# 6. Get a summary for one column
summary(GSS_sub$FAIR)
## summary(GSS_sub[,1]) & summary(GSS_sub[,"FAIR"]) & summary(GSS_sub[1]) & summary(GSS_sub[[1]]) & summary(GSS_sub["FAIR"]) & summary([["FAIR"]])
## summary(GSS_sub[,c("HELPFUL", "FAIR", "TRUST")])  can do multiple columns

# 7. Are any of the columns giving you unexpected values?
#    - missing values? (NA)
# Yes, there are missing or top-coded values in HELPFUL, FAIR, TRUST, AGE, HISPANIC, EDUC, DEGREE, and MARITAL variables.
## summary(GSS_sub)

# 8. Select a few key columns, make a vector of the column names
colnames(GSS_sub)
GSS_sub[c(2,3,4)]
## mycols <- c("HELPFUL", "FAIR", "TRUST")
## mycolumns <- c(2:4)
## colnames(GSS_sub)[mycolumns]
## summary(GSS_sub[, mycolumns])

# 9. Create a new data.frame with just that subset of columns
#    from #7
#    - do this in at least TWO different ways
recoded_var1 <- data.frame(col1=GSS_sub$HELPFUL, col2=GSS_sub$FAIR, col3=GSS_sub$TRUST, col4=GSS_sub$AGE, col5=GSS_sub$HISPANIC, col6=GSS_sub$EDUC, col7=GSS_sub$DEGREE, col8=GSS_sub$MARITAL)
recoded_var1

recoded_var2 <- GSS_sub[c(2,3,4,6,9,10,11,12)]
recoded_var2

## vec <- GSS_sub[,mycols]
## vec <- data.frame(GSS_sub[,mycols])
## head(vec)

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from #8
mydt1 <- GSS_sub[-(11:57051), c(2:4)]
mydt1

## top <- head(GSS_sub, 10)
## bottom <- tail(GSS_sub, 10)
## top.and.bottom <- rbind(top,bottom)
## t.and.b2 <- GSS_sub[c(1:10, 625:634), ] this way is least robust to changes
## nrows <- nrow(GSS_sub)
## t.and.b2 <- GSS_sub[c(1:10, nrows-9:nrows), ]

# 11. Create a new data.frame that is a random sample of half of the rows.
rs <- GSS_sub[sample(1:nrow(GSS_sub), 28531, replace=FALSE),]
rs

## ?sample
## GSS_sub.half <- GSS_sub[sample(nrow(GSS_sub), nrow(GSS_sub)/2, replace=FALSE),]

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it
group1 <- GSS_sub$TRUST[GSS_sub$SEX == 1]
group2 <- GSS_sub$TRUST[GSS_sub$SEX == 2]
t.test(group1, group2)
t.test(TRUST ~ SEX, data = GSS_sub)

HW2.ttest1 <- t.test(group1, group2)
HW2.ttest2 <- t.test(TRUST ~ SEX, data = GSS_sub)

# Sorry that I don't quite understand your question here. 
# If a vector formats invloves defining specific rows, then I don't think it's applicable in this comparison.
# Because each entry of data is randomly scarttered. I can only combine them into groups with same label values not values ranked in order.


# 13. Repeat #10 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)
cor.test(mydt1$HELPFUL, mydt1$FAIR)
cor.test(mydt1$HELPFUL, mydt1$FAIR, method="spearman") # Not sure why this doesn't work
cor.test(mydt1$HELPFUL, mydt1$FAIR, method="pearson") # I don't think this one works, either

cor(mydt1, use="pairwise.complete.obs", method="spearman")
cor(mydt1, use="pairwise.complete.obs", method="pearson")

HW2.corr1 <- cor.test(mydt1$HELPFUL, mydt1$FAIR)
HW2.corr2 <- cor(mydt1, use="pairwise.complete.obs", method="spearman")
HW2.corr3 <- cor(mydt1, use="pairwise.complete.obs", method="pearson")

# 14. Save all results from #12 and #13 in an .RData file
getwd()
setwd("C:/Users/HYH/Desktop/projects/r_programming_bsos/day2")
save(HW2.ttest1,HW2.ttest2,HW2.corr1,HW2.corr2,HW2.corr3, file = "results.RData")

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
