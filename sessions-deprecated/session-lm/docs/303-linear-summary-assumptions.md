---
output: html_document
editor_options:
  chunk_output_type: console
---
# Model diagnostics

**Aims**

- to introduce concepts of linear models summary and assumptions

**Learning outcomes**

- to able to interpret $R^2$ and $R^2(adj)$ values
- state the assumptions of a linear model and assess them using residual plots

## Assessing model fit
- earlier we learned how to estimate parameters in a liner model using least squares
- now we will consider how to assess the goodness of fit of a model
- we do that by calculating the amount of variability in the response that is explained by the model

## $R^2$: summary of the fitted model
- considering a simple linear regression, the simplest model, **Model 0**, we could consider fitting is $$Y_i = \beta_0+ \epsilon_i$$ that corresponds to a line that run through the data but lies parallel to the horizontal axis
- in our plasma volume example that would correspond the mean value of plasma volume being predicted for any value of weight (in purple)
<img src="303-linear-summary-assumptions_files/figure-html/unnamed-chunk-1-1.png" width="480" style="display: block; margin: auto;" />

- TSS, denoted **Total corrected sum-of-squares** is the residual sum-of-squares for Model 0
$$S(\hat{\beta_0}) = TSS = \sum_{i=1}^{n}(y_i - \bar{y})^2 = S_{yy}$$ corresponding the to the sum of squared distances to the purple line
<img src="303-linear-summary-assumptions_files/figure-html/unnamed-chunk-2-1.png" width="480" style="display: block; margin: auto;" />

- Fitting **Model 1** of the form $$Y_i = \beta_0 + \beta_1x + \epsilon_i$$ we have earlier defined
- **RSS**, the residual sum-of-squares as:
$$RSS = \displaystyle \sum_{i=1}^{n}(y_i - \{\hat{\beta_0} + \hat{\beta}_1x_{1i} + \dots + \hat{\beta}_px_{pi}\}) = \sum_{i=1}^{n}(y_i - \hat{y_i})^2$$
- that corresponds to the squared distances between the observed values $y_i, \dots,y_n$ to fitted values $\hat{y_1}, \dots \hat{y_n}$, i.e. distances to the red fitted line
<img src="303-linear-summary-assumptions_files/figure-html/unnamed-chunk-3-1.png" width="480" style="display: block; margin: auto;" />

\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:unnamed-chunk-4"><strong>(\#def:unnamed-chunk-4) </strong></span>
A simple but useful measure of model fit is given by $$R^2 = 1 - \frac{RSS}{TSS}$$ where:

- RSS is the residual sum-of-squares for Model 1, the fitted model of interest
- TSS is the sum of squares of the **null model**
</div>\EndKnitrBlock{definition}

- $R^2$ quantifies how much of a drop in the residual sum-of-squares is accounted for by fitting the proposed model
- $R^2$ is also referred as **coefficient of determination**
- It is expressed on a scale, as a proportion (between 0 and 1) of the total variation in the data
- Values of $R^2$ approaching 1 indicate he model to be a good fit
- Values of $R^2$ less than 0.5 suggest that the model gives rather a poor fit to the data

## $R^2$ and correlation coefficient
\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-5"><strong>(\#thm:unnamed-chunk-5) </strong></span>
In the case of simple linear regression:

Model 1: $Y_i = \beta_0 + \beta_1x + \epsilon_i$
$$R^2 = r^2$$
where:

- $R^2$ is the coefficient of determination
- $r^2$ is the sample correlation coefficient
</div>\EndKnitrBlock{theorem}

## $R^2(adj)$
- in the case of multiple linear regression, where there is more than one explanatory variable in the model
- we are using the adjusted version of $R^2$ to assess the model fit
- as the number of explanatory variables increase, $R^2$ also increases
- $R^2(adj)$ takes this into account, i.e. adjusts for the fact that there is more than one explanatory variable in the model

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-6"><strong>(\#thm:unnamed-chunk-6) </strong></span>For any multiple linear regression
$$Y_i = \beta_0 + \beta_1x_{1i} + \dots + \beta_{p-1}x_{(p-1)i} +  \epsilon_i$$ $R^2(adj)$ is defined as
$$R^2(adj) = 1-\frac{\frac{RSS}{n-p-1}}{\frac{TSS}{n-1}}$$ where

- $p$ is the number of independent predictors, i.e. the number of variables in the model, excluding the constant

$R^2(adj)$ can also be calculated from $R^2$:
$$R^2(adj) = 1 - (1-R^2)\frac{n-1}{n-p-1}$$
</div>\EndKnitrBlock{theorem}

We can calculate the values in R and compare the results to the output of linear regression

```r
htwtgen <- read.csv("data/lm/heights_weights_genders.csv")
head(htwtgen)
##   Gender   Height   Weight
## 1   Male 73.84702 241.8936
## 2   Male 68.78190 162.3105
## 3   Male 74.11011 212.7409
## 4   Male 71.73098 220.0425
## 5   Male 69.88180 206.3498
## 6   Male 67.25302 152.2122
attach(htwtgen)

## Simple linear regression
model.simple <- lm(Height ~ Weight, data=htwtgen)

# TSS
TSS <- sum((Height - mean(Height))^2)

# RSS
# residuals are returned in the model type names(model.simple)
RSS <- sum((model.simple$residuals)^2)
R2 <- 1 - (RSS/TSS)

print(R2)
## [1] 0.8551742
print(summary(model.simple))
## 
## Call:
## lm(formula = Height ~ Weight, data = htwtgen)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -5.8142 -0.9907  0.0263  0.9918  5.5950 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 4.848e+01  7.507e-02   645.8   <2e-16 ***
## Weight      1.108e-01  4.561e-04   243.0   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.464 on 9998 degrees of freedom
## Multiple R-squared:  0.8552,	Adjusted R-squared:  0.8552 
## F-statistic: 5.904e+04 on 1 and 9998 DF,  p-value: < 2.2e-16
## Multiple regression
model.multiple <- lm(Height ~ Weight + Gender, data=htwtgen)
n <- length(Weight)
p <- 1

RSS <- sum((model.multiple$residuals)^2)
R2_adj <- 1 - (RSS/(n-p-1))/(TSS/(n-1))

print(R2_adj)
## [1] 0.8608793
print(summary(model.multiple))
## 
## Call:
## lm(formula = Height ~ Weight + Gender, data = htwtgen)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -5.4956 -0.9583  0.0126  0.9867  5.8358 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 47.0306678  0.1025161  458.76   <2e-16 ***
## Weight       0.1227594  0.0007396  165.97   <2e-16 ***
## GenderMale  -0.9628643  0.0474947  -20.27   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.435 on 9997 degrees of freedom
## Multiple R-squared:  0.8609,	Adjusted R-squared:  0.8609 
## F-statistic: 3.093e+04 on 2 and 9997 DF,  p-value: < 2.2e-16
```

## The assumptions of a linear model
- up until now we were fitting models and discussed how to assess the model fit
- before making use of a fitted model for explanation or prediction, it is wise to check that the model provides an adequate description of the data
- informally we have been using box plots and scatter plots to look at the data
- there are however formal definitions of the assumptions

**Assumption A: The deterministic part of the model captures all the non-random structure in the data**

- this implies that the **mean of the errors $\epsilon_i$** is zero
- it applies only over the range of explanatory variables

**Assumption B: the scale of variability of the errors is constant at all values of the explanatory variables**

- practically we are looking at whether the observations are equally spread on both side of the regression line

**Assumption C: the errors are independent**

- broadly speaking this means that knowledge of errors attached to one observation does not give us any information about the error attached to another

**Assumptions D: the errors are normally distributed**

- this will allow us to describe the variation in the model's parameters estimates and therefore make inferences about the population from which our sample was taken

**Assumption E: the values of the explanatory variables are recorded without error**

- this one is not possible to check via examining the data, instead we have to consider the nature of the experiment

## Checking assumptions
**Residuals**, $\hat{\epsilon_i} = y_i - \hat{y_i}$ are the **main ingredient to check model assumptions**. We use plots such as:

1. Histograms or normal probability plots of $\hat{\epsilon_i}$
- useful to check the assumption of normality

2. Plots of $\hat{\epsilon_i}$ versus the fitted values $\hat{y_i}$
- used to detect changes in error variance
- used to check if the mean of the errors is zero

3. Plots of $\hat{\epsilon_i}$ vs. an explanatory variable $x_{ij}$
- this helps to check that the variable $x_j$ has a linear relationship with the response variable

4. Plots of $\hat{\epsilon_i}$ vs. an explanatory variable $x_{kj}$ that is **not** in the model
- this helps to check whether the additional variable $x_k$ might have a relationship with the response variable

4. Plots of $\hat{\epsilon_i}$ in the order of the observations were collected
- this is useful to check whether errors might be correlated over time

Let's look at the "good" example going back to our data of protein levels during pregnancy

```r
# read in data
data.protein <- read.csv("data/lm/protein.csv")

protein <- data.protein$Protein # our Y
gestation <- data.protein$Gestation # our X

model <- lm(protein ~ gestation)

# plot diagnostic plots of the linear model
# by default plot(model) calls four diagnostics plots
# par() divides plot window in 2 x 2 grid
par(mfrow=c(2,2))
plot(model)
```

<img src="303-linear-summary-assumptions_files/figure-html/unnamed-chunk-8-1.png" width="768" style="display: block; margin: auto;" />

- the residual plots provides examples of a situation where the assumptions appear to be met
- the linear regression appears to describe data quite well
- there is no obvious trend of any kind in the residuals vs. fitted values (the shape is scatted)
- points lie reasonably well along the line in the normal probability plot, hence normality appears to be met

**Examples of assumptions not being met**

<div class="figure" style="text-align: center">
<img src="figures/linear-models/lm-assumptions-01.png" alt="Example of data with a typical seasonal variation (up and down) coupled wtih a linear trend. The blue line gives the linear regression fit to the data, which clearly is not adequate. In comparison, if we used a non-parametric fit, we will get the red line as the fitted relationship. The residual plot retains pattern, given by orange line, indicating that the linear model is not appropriate in this case."  />
<p class="caption">(\#fig:lm-viol-01)Example of data with a typical seasonal variation (up and down) coupled wtih a linear trend. The blue line gives the linear regression fit to the data, which clearly is not adequate. In comparison, if we used a non-parametric fit, we will get the red line as the fitted relationship. The residual plot retains pattern, given by orange line, indicating that the linear model is not appropriate in this case.</p>
</div>

<div class="figure" style="text-align: center">
<img src="figures/linear-models/lm-assumptions-02.png" alt="Example of non-constant variance"  />
<p class="caption">(\#fig:lm-viol-02)Example of non-constant variance</p>
</div>

<div class="figure" style="text-align: center">
<img src="figures/linear-models/lm-assumptions-03.png" alt="Example of residulas deviating from QQ plot, i.e. not following normal distribution. The residuals can deviate in both upper and lower tail. On the left tails are lighter meaning that they have smaller values that what would be expected, on the right there are heavier tails with values larger than expected"  />
<p class="caption">(\#fig:lm-viol-03)Example of residulas deviating from QQ plot, i.e. not following normal distribution. The residuals can deviate in both upper and lower tail. On the left tails are lighter meaning that they have smaller values that what would be expected, on the right there are heavier tails with values larger than expected</p>
</div>


## Influential observations
- Sometimes individual observations can exert a great deal of influence on the fitted model
- One routine way of checking for this is to fit the model $n$ times, missing out each observation in turn
- If we removed i-th observation and compared the fitted value from the full model, say $\hat{y_j}$ to those obtained by removing this point, denoted $\hat{y_{j(i)}}$ then
- observations with a high Cook's distance (measuring the effect of deleting a given observation) could be influential

Let's remove some observation with higher Cook's distance from protein data set, re-fit our model and compare the diagnostics plots

```r
# observations to be removed (based on Residuals vs. Leverage plot)
obs <- c(18,7)

# fit models removing observations
model.2 <- lm(protein[-obs] ~ gestation[-obs])

# plot diagnostics plot
par(mfrow=c(2,2))
plot(model.2)
```

<img src="303-linear-summary-assumptions_files/figure-html/unnamed-chunk-9-1.png" width="672" />


## Selecting best model
- We have learned what linear models are, how to find estimates and interpret model coefficients and how to check for the overall relationship between response and predictors. We also know how to assess model fit, check model assumptions and find potential outliers. Given a set of predictors, e.g. many genes, how do we arrive at the best model?
- As a rule of thumb, we want a model that **fits the data best and is as simple as possible**, meaning it contains only relevant predictors.
- In practice, this means, that for smaller data sets, e.g. with up to 10 predictors, one works with **manually** trying different models, including different subsets of predictors, interactions terms and/or their transformations. 
- When the number of predictors is large, one can try **automated approaches of feature selection** like forward selection or stepwise regression, the last one demonstrated in the exercises below. 
- Finally, as we will learn later in the course, we can use **regularization techniques** that allow including all parameters in the model but constrain (regularizes) coefficient estimates towards zero for the less relevant predictors, preventing building complex models and thus overfitting. 

-----

## Exercises: linear models III

- **Data for exercises** can be downloaded from Github using [Link 1](https://github.com/olgadet/mlbiostats-linear-models/blob/main/data/data.zip) or from Canvas under Files -> data_exercises/linear-models

------

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:lm-brozek"><strong>(\#exr:lm-brozek) </strong></span>
Brozek score

Researchers collected age, weight, height and 10 body circumference measurements for 252 men in an attempt to find an alternative way of calculate body fat as oppose to measuring someone weight and volume, the latter one by submerging in a water tank. Is it possible to predict body fat using easy-to-record measurements?

Use lm() function and fit a linear method to model brozek, score estimate of percent body fat

- find $R^2$ and $R^2(adj)$
- assess the diagnostics plots to check for model assumptions
- delete observation #86 with the highest Cook's distance and re-fit the model (model.clean)
- look at the model summary. Are all variables associated with brozek score?
- try improving the model fit by removing variables with the highest p-value first and re-fitting the model until all the variables are significantly associated with the response (p value less than 0.1); note down the $R^2(adj)$ values while doing so
- compare the output models for model.clean and final model
</div>\EndKnitrBlock{exercise}


To access and preview the data:

```r
data(fat, package = "faraway")
```

## Answers to selected exercises (linear models III) {-}

Exr. \@ref(exr:lm-brozek)


```r
# access and preview data
data(fat, package = "faraway")
head(fat)
##   brozek siri density age weight height adipos  free neck chest abdom   hip
## 1   12.6 12.3  1.0708  23 154.25  67.75   23.7 134.9 36.2  93.1  85.2  94.5
## 2    6.9  6.1  1.0853  22 173.25  72.25   23.4 161.3 38.5  93.6  83.0  98.7
## 3   24.6 25.3  1.0414  22 154.00  66.25   24.7 116.0 34.0  95.8  87.9  99.2
## 4   10.9 10.4  1.0751  26 184.75  72.25   24.9 164.7 37.4 101.8  86.4 101.2
## 5   27.8 28.7  1.0340  24 184.25  71.25   25.6 133.1 34.4  97.3 100.0 101.9
## 6   20.6 20.9  1.0502  24 210.25  74.75   26.5 167.0 39.0 104.5  94.4 107.8
##   thigh knee ankle biceps forearm wrist
## 1  59.0 37.3  21.9   32.0    27.4  17.1
## 2  58.7 37.3  23.4   30.5    28.9  18.2
## 3  59.6 38.9  24.0   28.8    25.2  16.6
## 4  60.1 37.3  22.8   32.4    29.4  18.2
## 5  63.2 42.2  24.0   32.2    27.7  17.7
## 6  66.0 42.0  25.6   35.7    30.6  18.8
# fit linear regression model
model.all <- lm(brozek ~ age + weight + height + neck + abdom + hip + thigh + knee + ankle + biceps + forearm + wrist, data = fat)

# print model summary
print(summary(model.all))
## 
## Call:
## lm(formula = brozek ~ age + weight + height + neck + abdom + 
##     hip + thigh + knee + ankle + biceps + forearm + wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.2664  -2.5658  -0.0798   2.8976   9.3204 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -17.063433  14.489336  -1.178  0.24011    
## age           0.056520   0.029888   1.891  0.05983 .  
## weight       -0.085513   0.045170  -1.893  0.05954 .  
## height       -0.059703   0.086695  -0.689  0.49171    
## neck         -0.439315   0.214802  -2.045  0.04193 *  
## abdom         0.875779   0.070589  12.407  < 2e-16 ***
## hip          -0.192118   0.132655  -1.448  0.14885    
## thigh         0.237304   0.131793   1.801  0.07303 .  
## knee         -0.006595   0.222832  -0.030  0.97642    
## ankle         0.164831   0.204681   0.805  0.42144    
## biceps        0.149530   0.157693   0.948  0.34397    
## forearm       0.424885   0.182801   2.324  0.02095 *  
## wrist        -1.474317   0.494475  -2.982  0.00316 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.98 on 239 degrees of freedom
## Multiple R-squared:  0.7489,	Adjusted R-squared:  0.7363 
## F-statistic:  59.4 on 12 and 239 DF,  p-value: < 2.2e-16
# diagnostics plots
par(mfrow=c(2,2))
plot(model.all)

# remove potentially influential observations
obs <- c(86)
fat2 <- fat[-obs, ]

# re-fit the model
model.clean <- lm(brozek ~ age + weight + height + neck + abdom + hip + thigh + knee + ankle + biceps + forearm + wrist, data = fat)

# diagnostics plots
par(mfrow=c(2,2))
plot(model.clean)
```

<img src="303-linear-summary-assumptions_files/figure-html/unnamed-chunk-11-1.png" width="672" style="display: block; margin: auto;" />

```r
# model summary
print(summary(model.clean))
## 
## Call:
## lm(formula = brozek ~ age + weight + height + neck + abdom + 
##     hip + thigh + knee + ankle + biceps + forearm + wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.2664  -2.5658  -0.0798   2.8976   9.3204 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -17.063433  14.489336  -1.178  0.24011    
## age           0.056520   0.029888   1.891  0.05983 .  
## weight       -0.085513   0.045170  -1.893  0.05954 .  
## height       -0.059703   0.086695  -0.689  0.49171    
## neck         -0.439315   0.214802  -2.045  0.04193 *  
## abdom         0.875779   0.070589  12.407  < 2e-16 ***
## hip          -0.192118   0.132655  -1.448  0.14885    
## thigh         0.237304   0.131793   1.801  0.07303 .  
## knee         -0.006595   0.222832  -0.030  0.97642    
## ankle         0.164831   0.204681   0.805  0.42144    
## biceps        0.149530   0.157693   0.948  0.34397    
## forearm       0.424885   0.182801   2.324  0.02095 *  
## wrist        -1.474317   0.494475  -2.982  0.00316 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.98 on 239 degrees of freedom
## Multiple R-squared:  0.7489,	Adjusted R-squared:  0.7363 
## F-statistic:  59.4 on 12 and 239 DF,  p-value: < 2.2e-16
# re-fit the model (no height)
model.red1 <- lm(brozek ~ age + weight + neck + abdom + hip + thigh + knee + ankle + biceps + forearm + wrist, data = fat)
print(summary(model.red1))
## 
## Call:
## lm(formula = brozek ~ age + weight + neck + abdom + hip + thigh + 
##     knee + ankle + biceps + forearm + wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.2830  -2.6162  -0.1017   2.8789   9.3713 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -22.66569   11.97691  -1.892  0.05963 .  
## age           0.05948    0.02954   2.013  0.04521 *  
## weight       -0.09829    0.04114  -2.389  0.01765 *  
## neck         -0.43444    0.21445  -2.026  0.04389 *  
## abdom         0.88762    0.06839  12.979  < 2e-16 ***
## hip          -0.17180    0.12919  -1.330  0.18483    
## thigh         0.25327    0.12960   1.954  0.05183 .  
## knee         -0.02318    0.22128  -0.105  0.91665    
## ankle         0.17300    0.20411   0.848  0.39752    
## biceps        0.15695    0.15715   0.999  0.31894    
## forearm       0.43091    0.18239   2.363  0.01895 *  
## wrist        -1.51011    0.49120  -3.074  0.00235 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.976 on 240 degrees of freedom
## Multiple R-squared:  0.7484,	Adjusted R-squared:  0.7369 
## F-statistic:  64.9 on 11 and 240 DF,  p-value: < 2.2e-16
# re-fit the model (no knee)
model.red2 <- lm(brozek ~ age + weight + neck + abdom + hip + thigh + ankle + biceps + forearm + wrist, data = fat)
print(summary(model.red2))
## 
## Call:
## lm(formula = brozek ~ age + weight + neck + abdom + hip + thigh + 
##     ankle + biceps + forearm + wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.2552  -2.5979  -0.1133   2.8693   9.3584 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -23.08716   11.25781  -2.051  0.04137 *  
## age           0.05875    0.02864   2.051  0.04134 *  
## weight       -0.09965    0.03897  -2.557  0.01117 *  
## neck         -0.43088    0.21131  -2.039  0.04253 *  
## abdom         0.88875    0.06740  13.186  < 2e-16 ***
## hip          -0.17231    0.12884  -1.337  0.18234    
## thigh         0.24942    0.12403   2.011  0.04544 *  
## ankle         0.16946    0.20089   0.844  0.39974    
## biceps        0.15847    0.15616   1.015  0.31123    
## forearm       0.42946    0.18150   2.366  0.01876 *  
## wrist        -1.51470    0.48823  -3.102  0.00215 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.968 on 241 degrees of freedom
## Multiple R-squared:  0.7484,	Adjusted R-squared:  0.738 
## F-statistic: 71.69 on 10 and 241 DF,  p-value: < 2.2e-16
# re-fit the model (no ankle)
model.red3 <- lm(brozek ~ age + weight + neck + abdom + hip + thigh  + biceps + forearm + wrist, data = fat)
print(summary(model.red3))
## 
## Call:
## lm(formula = brozek ~ age + weight + neck + abdom + hip + thigh + 
##     biceps + forearm + wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.0740  -2.5615  -0.1021   2.7999   9.3199 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -20.61247   10.86240  -1.898   0.0589 .  
## age           0.05727    0.02857   2.004   0.0461 *  
## weight       -0.09141    0.03770  -2.424   0.0161 *  
## neck         -0.45458    0.20931  -2.172   0.0308 *  
## abdom         0.88098    0.06673  13.203   <2e-16 ***
## hip          -0.17575    0.12870  -1.366   0.1733    
## thigh         0.25504    0.12378   2.061   0.0404 *  
## biceps        0.15178    0.15587   0.974   0.3311    
## forearm       0.42805    0.18138   2.360   0.0191 *  
## wrist        -1.40948    0.47175  -2.988   0.0031 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.965 on 242 degrees of freedom
## Multiple R-squared:  0.7477,	Adjusted R-squared:  0.7383 
## F-statistic: 79.67 on 9 and 242 DF,  p-value: < 2.2e-16
# re-fit the model (no biceps)
model.red4 <- lm(brozek ~ age + weight + neck + abdom + hip + thigh  + forearm + wrist, data = fat)
print(summary(model.red4))
## 
## Call:
## lm(formula = brozek ~ age + weight + neck + abdom + hip + thigh + 
##     forearm + wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.0574  -2.7411  -0.1912   2.6929   9.4977 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -20.06213   10.84654  -1.850  0.06558 .  
## age           0.05922    0.02850   2.078  0.03876 *  
## weight       -0.08414    0.03695  -2.277  0.02366 *  
## neck         -0.43189    0.20799  -2.077  0.03889 *  
## abdom         0.87721    0.06661  13.170  < 2e-16 ***
## hip          -0.18641    0.12821  -1.454  0.14727    
## thigh         0.28644    0.11949   2.397  0.01727 *  
## forearm       0.48255    0.17251   2.797  0.00557 ** 
## wrist        -1.40487    0.47167  -2.978  0.00319 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.965 on 243 degrees of freedom
## Multiple R-squared:  0.7467,	Adjusted R-squared:  0.7383 
## F-statistic: 89.53 on 8 and 243 DF,  p-value: < 2.2e-16
# re-fit the model (no hip)
model.red5 <- lm(brozek ~ age + weight + neck + abdom  + thigh  + forearm + wrist, data = fat)
print(summary(model.red5))
## 
## Call:
## lm(formula = brozek ~ age + weight + neck + abdom + thigh + forearm + 
##     wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.0193  -2.8016  -0.1234   2.9387   9.0019 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -30.17420    8.34200  -3.617 0.000362 ***
## age           0.06149    0.02852   2.156 0.032047 *  
## weight       -0.11236    0.03151  -3.565 0.000437 ***
## neck         -0.37203    0.20434  -1.821 0.069876 .  
## abdom         0.85152    0.06437  13.229  < 2e-16 ***
## thigh         0.20973    0.10745   1.952 0.052099 .  
## forearm       0.51824    0.17115   3.028 0.002726 ** 
## wrist        -1.40081    0.47274  -2.963 0.003346 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.974 on 244 degrees of freedom
## Multiple R-squared:  0.7445,	Adjusted R-squared:  0.7371 
## F-statistic: 101.6 on 7 and 244 DF,  p-value: < 2.2e-16
# compare model.clean and final model
print(summary(model.clean))
## 
## Call:
## lm(formula = brozek ~ age + weight + height + neck + abdom + 
##     hip + thigh + knee + ankle + biceps + forearm + wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.2664  -2.5658  -0.0798   2.8976   9.3204 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -17.063433  14.489336  -1.178  0.24011    
## age           0.056520   0.029888   1.891  0.05983 .  
## weight       -0.085513   0.045170  -1.893  0.05954 .  
## height       -0.059703   0.086695  -0.689  0.49171    
## neck         -0.439315   0.214802  -2.045  0.04193 *  
## abdom         0.875779   0.070589  12.407  < 2e-16 ***
## hip          -0.192118   0.132655  -1.448  0.14885    
## thigh         0.237304   0.131793   1.801  0.07303 .  
## knee         -0.006595   0.222832  -0.030  0.97642    
## ankle         0.164831   0.204681   0.805  0.42144    
## biceps        0.149530   0.157693   0.948  0.34397    
## forearm       0.424885   0.182801   2.324  0.02095 *  
## wrist        -1.474317   0.494475  -2.982  0.00316 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.98 on 239 degrees of freedom
## Multiple R-squared:  0.7489,	Adjusted R-squared:  0.7363 
## F-statistic:  59.4 on 12 and 239 DF,  p-value: < 2.2e-16
print(summary(model.red5))
## 
## Call:
## lm(formula = brozek ~ age + weight + neck + abdom + thigh + forearm + 
##     wrist, data = fat)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -10.0193  -2.8016  -0.1234   2.9387   9.0019 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -30.17420    8.34200  -3.617 0.000362 ***
## age           0.06149    0.02852   2.156 0.032047 *  
## weight       -0.11236    0.03151  -3.565 0.000437 ***
## neck         -0.37203    0.20434  -1.821 0.069876 .  
## abdom         0.85152    0.06437  13.229  < 2e-16 ***
## thigh         0.20973    0.10745   1.952 0.052099 .  
## forearm       0.51824    0.17115   3.028 0.002726 ** 
## wrist        -1.40081    0.47274  -2.963 0.003346 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.974 on 244 degrees of freedom
## Multiple R-squared:  0.7445,	Adjusted R-squared:  0.7371 
## F-statistic: 101.6 on 7 and 244 DF,  p-value: < 2.2e-16
```

*Note: we have just run a very simple feature selection using stepwise regression. In this method, using backward elimination, we build a model containing all the variables and remove them one by one based on defined criteria (here we have used p-values) and we stop when we have a justifiable model or when removing a predictor does not change the chosen criterion significantly.*
