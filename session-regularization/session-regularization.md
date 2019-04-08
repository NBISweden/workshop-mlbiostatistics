Session regularization
================

### Learning outcomes

-   to be able to fit regression line and interpret regression model
-   to be able to use `lm` function in R for model fitting, obtaining confidence interval and predictions

Model comparison
----------------

### Example data

<details>

``` r
# To obtain exactly the same result as in the demo, set seed to 85
set.seed(85)
```

</details>

``` r
N=100 # no samples
P=10 # no variables

# Draw variables, x_1,...,x_2, from a uniform distribution
X=matrix(runif(N*(P+1)), nrow=N, ncol=P) 

# generate a y variable from a multivarite lm of 3 first X variables only
# intercept
b0=3
# effect sizes for first three variables
b=c(runif(3, min=1.5, max=3.5))
# generate y
y <- b0 + X[,1] * b [1] + X[,2] * b [2] + X[,3] * b [3] + rnorm(N) 
#y1 <- b0 + X[,seq(1,3)] %*% b [seq(1,3)] + rnorm(N) 
# Store in the Y matrix (really just a vector here)
Y = as.matrix(y)  
```

------------------------------------------------------------------------

Overfitting | `RSS example`
---------------------------

-   Consider the two models
-   What are the min RSS estimates of the two models? Let's plot them! -- 2 variables are clearly better than 1 variable <br><br><br>

``` r
# compute RSS for all models including variables
# 1-i, i <= P; store results in vector rss
rss= rep(NA,10) 
for(i in seq(1,P)){
  Xi=X[,seq(1,i)]
  rss[i] <- sum((lm(Y~Xi)$residuals)^2)
}
# plot RSS for models with 1 and 2 vaiables
plot(rss[seq(1,2)], xlim=c(1,P), ylim=c(floor(min(rss)),ceiling(max(rss))),ylab="log RSS", xlab="model #", type = "b", log="y")
```

![](session-regularization_files/figure-markdown_github/unnamed-chunk-1-1.png)

Now repeat this for the sequence of

<details>

``` r
# plot RSS for all models
plot(rss[seq(1,P)], xlim=c(1,P), ylim=c(floor(min(rss)),ceiling(max(rss))), ylab="log RSS", xlab="model #", type = "b", log="y")
```

![](session-regularization_files/figure-markdown_github/unnamed-chunk-2-1.png) </details>

### Estimating the Coefficients

### Assessing the Accuracy of the Coefficient Estimates

### Asesssing the Accuracy of the Model

    ## [1] 0.7591266

    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -0.27880 -0.14178 -0.01928  0.13986  0.32939 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)  
    ## (Intercept)  0.08572    1.02400   0.084   0.9360  
    ## x            0.04362    0.01527   2.857   0.0289 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.2188 on 6 degrees of freedom
    ## Multiple R-squared:  0.5763, Adjusted R-squared:  0.5057 
    ## F-statistic:  8.16 on 1 and 6 DF,  p-value: 0.02893

    ##          x 
    ## 0.01526836

    ##        x 
    ## 1.023998

Multiple linear regression
--------------------------

### Estimating the Regression Coefficients

### Estimating coefficients

### Relationship between the response and predictors

### Model fit

### Predictions

### Qualitative predictors

### Interaction terms

### Non-linear transformation of the predictors

### Potential problems: non-linearity, collinearity

### Logistic regression
