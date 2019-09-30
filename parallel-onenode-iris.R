library(parallel)
library(foreach)
library(doParallel)
ncores <- Sys.getenv("SLURM_CPUS_PER_NODE")
if (ncores == '') {
  ncores <- 2
} else {
  ncores <- stroi(ncores) } 
cl <- makeCluster(2)
registerDoParallel(cl)
x <- iris[which(iris[,5] != "setosa"), c(1,5)]
trials <- 10000
system.time({
  r <- foreach(icount(trials), .combine=rbind) %dopar% {
    ind <- sample(100, 100, replace=TRUE)
   result1 <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
  coefficients(result1)
 }
})
stopCluster(cl)
