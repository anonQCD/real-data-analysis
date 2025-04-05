# load real world data
library(readxl)
ba = read_xlsx('BA.xlsx', col_names = TRUE)
hf = read_xlsx('HF.xlsx', col_names = TRUE)
ins = read_xlsx('INS.xlsx', col_names = TRUE)
pb = read_xlsx('PB.xlsx', col_names = TRUE)

# load necessary packages
library(devtools)
install_github('anonQCD/QCD')
library(QCD)
library(quantreg)
library(QICD)

# merge data
library(dplyr)
dfs = list(ba, hf, ins, pb)
df = Reduce(function(x,y) merge(x, y, by = "...1"), dfs)
df = df[,-1] # 36 x 100

# select one firm and create y vector, remainder as x matrix
# index : (ba) 2 boa, 1 citi, 7 amex / (hf) 26 shepherd, 38 York Investment, 46 Fairfield
# index : (ins) 57 METLIFE, 63 AETNA, 65 PROGRESSIVE / (pb) 76 GS, 77 morgan stanely, 79 lehman brothers
y = as.matrix(df[,1]) 
x = as.matrix(df[,-1]) 
x = cbind(x[-1,], x[-36,]) # 35 x 198
y = y[-1]
x = scale(x)
y = scale(y)

# runtime analysis
p = ncol(x); n = nrow(x)
tau = 0.3
upper = 10; lower = -5
lambda.grid = 2^seq(upper, lower, by = -0.2)

ptm1 <- proc.time()
set.seed(1)
qcd = qcd.path(x = x, y = y, funname = "LASSO", lambda = lambda.grid, tau = tau,
              nudge = TRUE, nudgesd = 0.01)
t.qcd = proc.time()-ptm1

ptm2 <- proc.time()
qicd = QICD(y = y, x = x, lambda =  lambda.grid, 
            tau = tau, intercept = FALSE, funname = 'lasso')
t.qicd = proc.time()-ptm2

ptm3 <- proc.time()
lp.coef = matrix(NA, ncol = length(lambda.grid), nrow = ncol(x))
for(l in 1:length(lambda.grid)){
  lp = rq.fit.lasso(x = x, y = y, tau = tau, 
                    lambda = rep(lambda.grid[l]*2, p))
  lp.coef[,l] = lp$coefficients
}
t.lp = proc.time()-ptm3

c(as.numeric(t.qcd[3]), as.numeric(t.qicd[3]), as.numeric(t.lp[3]))

# minimum BIC analysis
bicscore = function(tau, y, x, betahat){
  res = y - x %*% betahat
  loss = sum(QICD::checkloss(res, tau = tau))
  n = length(y)
  k = ncol(x)
  bic = log(n) * k + 2 * loss
  return(bic)
}

lp.bic = c(); qicd.bic = c(); qcd.bic = c()
for(l in 1:length(lambda.grid)){
  lp.bic = append(lp.bic, bicscore(tau, y, x, betahat = lp.coef[,l]))
  qicd.bic = append(qicd.bic, bicscore(tau, y, x, betahat = qicd$beta_final[,l]))
  qcd.bic = append(qcd.bic, bicscore(tau, y, x, betahat = qcd$beta[,l]))
}
bics = data.frame(bic = c(lp.bic, qicd.bic, qcd.bic),
                  lambda = log2(lambda.grid),
                  method = c(rep('LP', length(lambda.grid)), 
                             rep('QICD', length(lambda.grid)), 
                             rep('QCD', length(lambda.grid))))

round(c(min(lp.bic), min(qicd.bic), min(qcd.bic)), 2)
