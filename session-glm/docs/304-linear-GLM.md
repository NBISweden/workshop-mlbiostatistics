---
output: html_document
editor_options: 
  chunk_output_type: console
---

# Generalized linear models

**Aims**

- to briefly introduce GLMs via examples of modeling binary and count response

**Learning outcomes**

- to understand the limits of linear regression and the application of GLMs
- to be able to use `glm()` function to fit and interpret logistic and Poisson regression



## Why Generalized Linear Models (GLMs)
- GLMs extend linear model framework to outcome variables that do not follow normal distribution
- They are most frequently used to model binary, categorical or count data
- In the Galapagos Island example we have tried to model Species using linear model
- It kind of worked but the predicted counts were not counts (natural numbers) but rational numbers instead that make no sense when taking about count data
- Similarly, fitting a regression line to binary data yields predicted values that could take any value, including $<0$
- not to mention that it is hard to argue that the values of 0 and 1s are normally distributed

<div class="figure" style="text-align: center">
<img src="304-linear-GLM_files/figure-html/unnamed-chunk-2-1.png" alt="Example of fitting linear model to binary data, to model the acceptance to medical school, coded as 1 (Yes) and 0 (No) using GPA school scores. Linear model does not fit the data well in this case" width="384" />
<p class="caption">(\#fig:unnamed-chunk-2)Example of fitting linear model to binary data, to model the acceptance to medical school, coded as 1 (Yes) and 0 (No) using GPA school scores. Linear model does not fit the data well in this case</p>
</div>

## Logistic regression
- [Yanny or Laurel auditory illusion](https://www.theguardian.com/global/video/2018/may/16/what-do-you-hear-in-this-audio-clip-yanny-or-laurel-takes-internet-by-storm-video) appeared online in May 2018. You could find lots of information about it, together with some plausible explanations why some people hear Yanny and some year Laurel
- One of the explanation is that with age we lose the ability to hear certain sounds
- To see if there is evidence for that, someone has already collected some data for 53 people including their age and gender





```r
# Read in and preview data
yl <- read.csv("data/lm/yanny-laurel.csv")
head(yl)
##     hear age gender
## 1  Yanny  40 Female
## 2  Yanny  48   Male
## 3  Yanny  32 Female
## 4 Laurel  47 Female
## 5 Laurel  60   Male
## 6  Yanny  11 Female
# Recode Laurel to 0 and Yanny as 1 in new variable
yl$word <- 0
yl$word[yl$hear=="Yanny"] <- 1

# Make some exploratory plots
par(mfrow=c(1,2))
plot(yl$age, yl$word, pch=19, xlab="age", ylab="", las=1)
boxplot(yl$age~yl$hear, xlab="", ylab="age", col="lightblue")
```

<div class="figure" style="text-align: center">
<img src="304-linear-GLM_files/figure-html/unnamed-chunk-4-1.png" alt="Yanny and Laurel auditory illusion data, Yanny (1), Laurel (0)" width="768" />
<p class="caption">(\#fig:unnamed-chunk-4)Yanny and Laurel auditory illusion data, Yanny (1), Laurel (0)</p>
</div>

- Since the response variable takes only two values (Yanny or Laurel) we use GLM model 
- to fit **logistic regression** model for the **probability of hearing Yanny**
- we let $p_i=P(Y_i=1)$ denote the probability of hearing Yanny (success)
- and we assume that the response follows binomial distribution: $Y_i \sim Bi(1, p_i)$ distribution 
- We can write the regression model now as: 
$$log(\frac{p_i}{1-p_i})=\beta_0 + \beta_1x_i$$
and given the properties of logarithms this is also equivalent to:
$$p_i = \frac{exp(\beta_0 + \beta_1x_i)}{1 + exp(\beta_0 + \beta_1x_i)}$$
- In essence, the GLM generalizes linear regression by allowing the linear model to be related to the response variable via a **link function**.
- Here, the **link function** $log(\frac{p_i}{1-p_i})$ provides the link between the binomial distribution of $Y_i$ (hearing Yanny) the linear predictor (age) 
- Thus **GLM model** can be written as $$g(\mu_i)=\mathbf{X}\boldsymbol\beta$$ where `g()` is the link function.
- We use `glm()` function in R to fit GLM models


```r
# fit logistic regression model
logmodel.1 <- glm(word ~ age, family = binomial(link="logit"), data = yl)

# print model summary
print(summary(logmodel.1))
```

```
## 
## Call:
## glm(formula = word ~ age, family = binomial(link = "logit"), 
##     data = yl)
## 
## Deviance Residuals: 
##      Min        1Q    Median        3Q       Max  
## -2.47887  -0.64434   0.04733   0.71414   1.86068  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  3.56159    0.95790   3.718 0.000201 ***
## age         -0.08943    0.02297  -3.893 9.89e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 83.178  on 59  degrees of freedom
## Residual deviance: 57.967  on 58  degrees of freedom
## AIC: 61.967
## 
## Number of Fisher Scoring iterations: 4
```

```r
# plot
ggPredict(logmodel.1)
```

<div class="figure" style="text-align: center">
<img src="304-linear-GLM_files/figure-html/unnamed-chunk-5-1.png" alt="Fitted logistic model to the Yanny and Laurel data" width="384" />
<p class="caption">(\#fig:unnamed-chunk-5)Fitted logistic model to the Yanny and Laurel data</p>
</div>

```r
# to get predictions use predict() functions
# if no new observations is specified predictions are returned for the values of exploratory variables used
# we specify response to return prediction on the probability scale
predict(logmodel.1, type="response")
```

```
##          1          2          3          4          5          6          7 
## 0.49605808 0.32492276 0.66812207 0.34483848 0.14131059 0.92942018 0.12096590 
##          8          9         10         11         12         13         14 
## 0.93506630 0.64800232 0.30562070 0.08777973 0.84336442 0.21962666 0.56280008 
##         15         16         17         18         19         20         21 
## 0.60620835 0.40769465 0.79013533 0.54068483 0.30562070 0.77492061 0.51840817 
##         22         23         24         25         26         27         28 
## 0.79013533 0.28697783 0.89384641 0.02677553 0.34483848 0.88505672 0.79013533 
##         29         30         31         32         33         34         35 
## 0.87564050 0.09521009 0.12096590 0.06853892 0.84336442 0.81826092 0.66812207 
##         36         37         38         39         40         41         42 
## 0.40769465 0.05326930 0.93506630 0.17709634 0.08777973 0.17709634 0.07447355 
##         43         44         45         46         47         48         49 
## 0.16443687 0.95369025 0.49605808 0.62734317 0.02248876 0.54068483 0.58466845 
##         50         51         52         53         54         55         56 
## 0.64800232 0.95369025 0.16443687 0.84336442 0.79013533 0.77492061 0.84336442 
##         57         58         59         60 
## 0.26903158 0.64800232 0.56280008 0.12096590
```

- The regression equation for the fitted model is:
$$log(\frac{\hat{p_i}}{1-\hat{p_i}})=-3.56  +  0.09x_i$$
- we see from the output that $\hat{\beta_0} = -3.56$ and $\hat{\beta_1} = 0.09$
- these estimates are arrived at via maximum likelihood estimation, something that is out of scope here
- but similarly to linear models, we can test the null hypothesis $H_0:\beta_1=0$ by comparing,  $z = \frac{\hat{\beta_1}}{e.s.e(\hat{\beta_1)}} = 3.89$ with a standard normal distribution, and the associated value is small so there is enough evidence to reject the null, meaning that age is significantly associated with the probability with hearing Laurel and Yanny, **Wald test**
- the same conclusion can be reached if we compare the **residual deviance**

**Deviance**

- deviance is the number that measures the goodness of fit of a logistic regression model
- we use saturated and residual deviance to assess model, instead of $R^2$ or $R^2(adj)$
- for a GLM model that fits the data well the approximate deviance $D$ is
$$\chi^2(m-p)$$ where $m$ is the number of parameters in the saturated model (full model) and $p$ is the number of parameters in the model of interest
- for our above model we have $83.178  - 57.967 = 25.21$ which is larger than 95th percentile of $\chi^2(59-58)$

```r
qchisq(df=1, p=0.95)
## [1] 3.841459
```
- i.e. $25.21 >> 3.84$ and again we can conclude that age is a significant term in the model

**Odds ratios**

- In logistic regression we often interpret the model coefficients by taking $e^{\hat{\beta}}$
- and we talk about **odd ratios**
- e.g. we can say, given our above model, $e^{0.08943} = 1.093551$ that for each unit increase in age the odds of hearing Laurel get multiplied by 1.09

**Other covariates**

- Finally, we can use the same logic as in multiple regression to expand by models by additional variables, numerical, binary or categorical
- E.g. we can test whether there is a gender effect when hearing Yanny or Laurel


```r
# fit logistic regression including age and gender
logmodel.2 <- glm(word ~ age + gender, family = binomial(link="logit"), data = yl)

# print model summary
print(summary(logmodel.2))
## 
## Call:
## glm(formula = word ~ age + gender, family = binomial(link = "logit"), 
##     data = yl)
## 
## Deviance Residuals: 
##      Min        1Q    Median        3Q       Max  
## -2.44755  -0.67360   0.06218   0.72585   1.81723  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  3.72679    1.07333   3.472 0.000516 ***
## age         -0.09061    0.02337  -3.877 0.000106 ***
## genderMale  -0.23919    0.65938  -0.363 0.716789    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 83.178  on 59  degrees of freedom
## Residual deviance: 57.835  on 57  degrees of freedom
## AIC: 63.835
## 
## Number of Fisher Scoring iterations: 5
# plot model
ggPredict(logmodel.2)
```

<div class="figure" style="text-align: center">
<img src="304-linear-GLM_files/figure-html/unnamed-chunk-7-1.png" alt="Yanny Laurel data modelled with logistic regression given age and gender. Regression lines in males and femals are very alike and the model suggest no gender effect" width="384" />
<p class="caption">(\#fig:unnamed-chunk-7)Yanny Laurel data modelled with logistic regression given age and gender. Regression lines in males and femals are very alike and the model suggest no gender effect</p>
</div>

## Poisson regression
- GLMs can be also applied to count data
- e.g. hospital admissions due to respiratory disease or number of bird nests in a certain habitat
- here, we commonly assume that data follow the Poisson distribution $Y_i \sim Pois(\mu_i)$
- and the corresponding model is 
$$E(Y_i)=\mu_i = \eta_ie^{\mathbf{x_i}^T\boldsymbol\beta}$$ with a log link $\ln\mu_i = \ln \eta_i + \mathbf{x_i}^T\boldsymbol\beta$

**Data set**
Suppose we wish to model $Y_i$ the number of cancer cases in the i-th intermediate geographical location (IG) in Glasgow. We have collected data for 271 regions, a small areas that contain between 2500 and 6000 people. Together with cancer occurrence with have data:

- Y\_all: number of cases of all types of cancer in te IG in 2013
- E\_all: expected number of cases of all types of cancer for the IG based on the population size and demographics of the IG in 2013
- pm10: air pollution
- smoke: percentage of people in an area that smoke
- ethic: percentage of people who are non-white
- logpice: natural log of average house price
- easting and northing: co-ordinates of the central point of the IG divided by 10000

We can model the **rate of occurrence of cancer** using the very same `glm` function:¨
- now we use **poisson family distribution** to model counts
- and we will include an **offset term** to model as we are modeling the rate of occurrence of the cancer that has to be adjusted by different number of people living in different regions


```r
# Read in and preview data
cancer <- read.csv("data/lm/cancer.csv")
head(cancer)
##          IG Y_all     E_all pm10 smoke ethnic log.price  easting northing
## 1 S02000260   133 106.17907 17.8  21.9   5.58  11.59910 26.16245 66.96574
## 2 S02000261    38  62.43131 18.6  21.8   7.91  11.84940 26.29271 67.00278
## 3 S02000262    97 120.00694 18.6  20.8   9.58  11.74106 26.21429 67.04280
## 4 S02000263    80 109.10245 17.0  14.0  10.39  12.30138 25.45705 67.05938
## 5 S02000264   181 149.77821 18.6  15.2   5.67  11.88449 26.12484 67.09280
## 6 S02000265    77  82.31156 17.0  14.6   5.61  11.82004 25.37644 67.09826
# fit Poisson regression
epid1 <- glm(Y_all ~ pm10 + smoke + ethnic + log.price + easting + northing + offset(log(E_all)), 
             family = poisson, 
             data = cancer)

print(summary(epid1))
## 
## Call:
## glm(formula = Y_all ~ pm10 + smoke + ethnic + log.price + easting + 
##     northing + offset(log(E_all)), family = poisson, data = cancer)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -4.2011  -0.9338  -0.1763   0.8959   3.8416  
## 
## Coefficients:
##               Estimate Std. Error z value Pr(>|z|)    
## (Intercept) -0.8592657  0.8029040  -1.070 0.284531    
## pm10         0.0500269  0.0066724   7.498 6.50e-14 ***
## smoke        0.0033516  0.0009463   3.542 0.000397 ***
## ethnic      -0.0049388  0.0006354  -7.773 7.66e-15 ***
## log.price   -0.1034461  0.0169943  -6.087 1.15e-09 ***
## easting     -0.0331305  0.0103698  -3.195 0.001399 ** 
## northing     0.0300213  0.0111013   2.704 0.006845 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for poisson family taken to be 1)
## 
##     Null deviance: 972.94  on 270  degrees of freedom
## Residual deviance: 565.18  on 264  degrees of freedom
## AIC: 2356.2
## 
## Number of Fisher Scoring iterations: 4
```

**Hypothesis testing, model fit and predictions**

- follows stay the same as for logistic regression

**Rate ratio**

- similarly to logistic regression it common to look at the $e^\beta$
- for instance we are interested in the effect of air pollution on health, we could look at the pm10 coefficient
- coefficient is positive, 0.0500269, indicating that cancer incidence rate increase with increased air poluttion
- the rate ratio allows us to quantify by how much, here by a factor of $e^{0.0500269} = 1.05$ 

-----

## Exercises (GLMs)

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:glm-rerun"><strong>(\#exr:glm-rerun) </strong></span>
Make sure you can run and understand the above code for logistic and Poisson regression
</div>\EndKnitrBlock{exercise}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:glm-wcgs"><strong>(\#exr:glm-wcgs) </strong></span>
Additional practice with a bigger more realistic data set. 

What might affect the chance of getting a heart disease? One of the earliest studies addressing this issue started in 1960 in 3154 healthy men in the San Francisco area. At the start of the study all were free of heart disease. Eight years later the study recorded whether these men now suffered from heart disease (chd), along with many other variables that might be related. 

The data is available from the faraway package and includes variables:

- age: age in years
- height: height in inches
- weight: weight in pounds
- sdp: systolic blood pressure in mm Hg
- dbp: diastolic blood pressure in mm Hg
- chol: Fasting serum cholesterol in mm %
- behave: behavior type which is a factor with levels A1 A2 B3 B4
- cigs: number of cigarettes smoked per day
- dibep: behavior type a factor with levels A (Agressive) B (Passive)
- chd: coronary heat disease developed is a factor with levels no yes
- typechd: type of coronary heart disease is a factor with levels angina infdeath none silent 
- timechd: Time of CHD event or end of follow-up
- arcus: arcus senilis is a factor with levels absent present

a) using logistic regression, can you discover anything interesting about the probability of developing heart disease (chd)?
b) using Poisson regression, can you comment about the numbers of cigarettes smoked (cigs)?
</div>\EndKnitrBlock{exercise}



```r
library(faraway)
data(wcgs, package="faraway")

head(wcgs)
##      age height weight sdp dbp chol behave cigs dibep chd  typechd timechd
## 2001  49     73    150 110  76  225     A2   25     B  no     none    1664
## 2002  42     70    160 154  84  177     A2   20     B  no     none    3071
## 2003  42     69    160 110  78  181     B3    0     A  no     none    3071
## 2004  41     68    152 124  78  132     B4   20     A  no     none    3064
## 2005  59     70    150 144  86  255     B3   20     A yes infdeath    1885
## 2006  44     72    204 150  90  182     B4    0     A  no     none    3102
##        arcus
## 2001  absent
## 2002 present
## 2003  absent
## 2004  absent
## 2005 present
## 2006  absent
```

----

Answers to selected exercises

Exr. \@ref(exr:glm-wcgs) possible solution

a) probability of developing heart disease

We first check the relationship between variables to gain more understanding of the data. We discover that a couple of variables are exactly collinear with other variables, including `typechd`, `timechd` and `dibep`. We do not include these in the model. 

```r
# `chd` and `typechd` were correlated.
with(wcgs, table(chd, typechd))
##      typechd
## chd   angina infdeath none silent
##   no       0        0 2897      0
##   yes     51      135    0     71
# `timechd` is an outcome variable affected by `chd`.
by(wcgs$timechd, wcgs$chd, summary)
## wcgs$chd: no
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     238    2864    2952    2775    3048    3430 
## ------------------------------------------------------------ 
## wcgs$chd: yes
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##      18     934    1666    1655    2400    3229
# `behave` has more detailed info of `dibep` -> exact collinearity
with(wcgs, table(behave, dibep))
##       dibep
## behave    A    B
##     A1    0  264
##     A2    0 1325
##     B3 1216    0
##     B4  349    0
```

We fit logistic regression model to explain the probability of developing cardiac disease (`chd`) given the remaining variables

```r
model1 <- glm(chd ~ . - typechd - timechd - dibep, data = wcgs, family = binomial)
summary(model1)
```

```
## 
## Call:
## glm(formula = chd ~ . - typechd - timechd - dibep, family = binomial, 
##     data = wcgs)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.3653  -0.4362  -0.3128  -0.2208   2.8603  
## 
## Coefficients:
##                Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  -12.331126   2.350347  -5.247 1.55e-07 ***
## age            0.061812   0.012421   4.977 6.47e-07 ***
## height         0.006903   0.033335   0.207  0.83594    
## weight         0.008637   0.003892   2.219  0.02647 *  
## sdp            0.018146   0.006435   2.820  0.00481 ** 
## dbp           -0.000916   0.010903  -0.084  0.93305    
## chol           0.010726   0.001531   7.006 2.45e-12 ***
## behaveA2       0.082920   0.222909   0.372  0.70990    
## behaveB3      -0.618013   0.245032  -2.522  0.01166 *  
## behaveB4      -0.487224   0.321325  -1.516  0.12944    
## cigs           0.021036   0.004298   4.895 9.84e-07 ***
## arcuspresent   0.212796   0.143915   1.479  0.13924    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 1769.2  on 3139  degrees of freedom
## Residual deviance: 1569.1  on 3128  degrees of freedom
##   (14 observations deleted due to missingness)
## AIC: 1593.1
## 
## Number of Fisher Scoring iterations: 6
```

And we notice that many variables including `age`, `chol`, and `cigs`, were significantly associated with heart disease development. For example, increment of one mm % of Fasting serum cholesterol (`chol`) elevated the odds of the disease by a factor of $e^{0.010726} = 1.010784$ after adjustment for the effects of the other variables.

b) numbers of cigarettes smoked

Many variables were correlated with the number of cigarettes.
For example, one mm Hg increase of systolic blood pressure was correlated with the increase of average number of cigarettes smoked by a factor of $e^{0.0024264} = 1.002429$. 

```r
# check distribution
hist(wcgs$cigs, breaks = 25)
```

<img src="304-linear-GLM_files/figure-html/unnamed-chunk-12-1.png" width="672" />

```r
# Poisson regression for age
model2 <- glm(cigs ~ age, data = wcgs, family = poisson)
summary(model2)
```

```
## 
## Call:
## glm(formula = cigs ~ age, family = poisson, data = wcgs)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -4.837  -4.820  -4.787   2.254  15.839  
## 
## Coefficients:
##               Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  2.5038936  0.0441558  56.706   <2e-16 ***
## age         -0.0011423  0.0009481  -1.205    0.228    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for poisson family taken to be 1)
## 
##     Null deviance: 62697  on 3153  degrees of freedom
## Residual deviance: 62696  on 3152  degrees of freedom
## AIC: 70053
## 
## Number of Fisher Scoring iterations: 6
```

```r
# Poisson regression for weight
model3 <- glm(cigs ~ weight, data = wcgs, family = poisson)
summary(model3)
```

```
## 
## Call:
## glm(formula = cigs ~ weight, family = poisson, data = wcgs)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -5.720  -4.803  -4.347   2.441  15.779  
## 
## Coefficients:
##               Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  3.2939845  0.0430796   76.46   <2e-16 ***
## weight      -0.0049918  0.0002548  -19.59   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for poisson family taken to be 1)
## 
##     Null deviance: 62697  on 3153  degrees of freedom
## Residual deviance: 62307  on 3152  degrees of freedom
## AIC: 69664
## 
## Number of Fisher Scoring iterations: 6
```

```r
# Poisson regression for systolic blood pressure
model4 <- glm(cigs ~ sdp, data = wcgs, family = poisson)
summary(model4)
```

```
## 
## Call:
## glm(formula = cigs ~ sdp, family = poisson, data = wcgs)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -5.445  -4.800  -4.707   2.351  15.922  
## 
## Coefficients:
##              Estimate Std. Error z value Pr(>|z|)    
## (Intercept) 2.1382494  0.0440018  48.595  < 2e-16 ***
## sdp         0.0024264  0.0003382   7.175 7.21e-13 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for poisson family taken to be 1)
## 
##     Null deviance: 62697  on 3153  degrees of freedom
## Residual deviance: 62647  on 3152  degrees of freedom
## AIC: 70004
## 
## Number of Fisher Scoring iterations: 6
```



