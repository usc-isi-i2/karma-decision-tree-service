library(rpart)

args <- commandArgs(TRUE)
dataset <- read.csv(args[1])
modelFilePath <- args[2]
cols <- names(dataset)
n_cols <- length(cols)
# Assuming that the last column has the labels
fmla <- as.formula(paste(cols[n_cols], "~", paste(cols[1:n_cols-1], collapse = "+")))
DTModel <- rpart(fmla, data = dataset, method = "class")
save(DTModel, file = modelFilePath)
summary(DTModel)