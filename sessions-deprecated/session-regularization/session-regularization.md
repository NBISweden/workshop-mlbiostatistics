---
title: "Session Regularization"
output:
  html_document:
    code_folding: hide
    keep_md: true
  pdf_document: default
editor_options:
  chunk_output_type: console
---


### Learning outcomes

* Likelihood
    + Relation to OLS for linear model
    + Likelihood and an orientation to Bayesian statistics
* Overfitting
* Regularization
    + relation to Bayesian statistics
    + Model comparison 
        - AIC
    + Feature selection
        - LASSO, ridge regression
* Cross validation



# Likelihood

<details>
<summary> Lecture notes </summary>

Likelihood is concerned with estimating how likely it is that a certain model or certain model parameter values are *true* ones.

Consider a generative model, with parameters $\theta$, for how $X\rightarrow Y$. We would like to test if $\theta$ are good parameters. Given the model, we can compute
$Pr[Y| X, \theta]$,
that is, the probability that the model with parameters $\theta$ and given $X$ generates $Y$. 

Likelihood builds on the intuition that if $\theta$ (or the model) is close to the 'truth', then $Pr[Y| X, \theta]$ will be higher than for wrong $\theta$ (model). We should therefore select the $\theta$ that maximizes $Pr[Y| X, \theta]$; this is called maximum likelihood estimation (MLE) of $\theta$.

Since statistical model contain an element of randomness, the reasoning above might not always be correct for any single obeservation. However, if we sum over a large number of observations it will be true on average. Hence the need for datasets that are large enough.

To formalize this intuition, Edwards (1972) defined the likelihood of model parameters being true given observed data as

$$L[\theta|Y,X] \propto Pr[Y|X, \theta]$$
Notice that this means that $L[\theta|Y,X]$ is not a proper probability, hence the term *likelihood* is used.
<details>
<summary> Extra Reading </summary>

Notice that this notation is not uncommonly mixed up, so you might also see the notation $L[Y|X,\theta]$ for the likelihood.

Similarly $\propto Pr[Y|X, \theta]$ is often referred to as the *likelihood function*.

***
</details>

In practice, the proportionality is ignored and we set

$$L[\theta|Y,X] = Pr[Y|X, \theta]$$

<details>
<summary> Extra Reading </summary>
The proportionality (indicated by '$\propto$') means there are some unknown constant factor, $k$, such that $L[\theta|Y,X] = k Pr[Y|X, \theta]$. However, the factor $k$ is assumed to be constant over $\theta$s and over models. 

When the likelihood of two $\theta$s (or models) are compared this is almost always done as a _likelihood ratio_, 

$$\frac{L[\theta_1|Y,X]}{L[\theta_0|Y,X]} = \frac{k Pr[Y|X, \theta_1]}{ k  Pr[Y|X, \theta_0]} =\frac{Pr[Y|X, \theta_1]}{ Pr[Y|X, \theta_0]}$$

which means that the factor $k$ disappears. Hence the factor $k$ is always ignored. Likelihood ratios is the basis of most model comparison statistics, e.g., the Wald test, the Score test, regularization... 

***
</details>

In maximum likelihood estimation of some parameters $\theta$, one simply selects the estimates $\widehat\theta$ that gives the highest likelihood $max_{\theta}L[\theta|X,Y] = L[\widehat\theta|X,Y]$. In many applications of  likelihood and maximum likelihood, it is practical to instead use the logarithm of the likelihood, the logLikelihood, $\log L[\theta_1|Y,X]$.
<details>
<summary> Extra Reading </summary>
As mentioned above, the logarithm of the likelihood, the logLikelihood, $\log L[\theta_1|Y,X]$, or sometimes the negative logLikelihood, $-\log L[\theta_1|Y,X]$, is often used. Notice, that 

1. The $\theta$ estimates that maximizes  $\log L[\theta|Y,X]$ also maximizes $L[\theta|Y,X]$
2. The $\theta$ estimates that minimizes $-\log L[\theta|Y,X]$ maximizes $L[\theta|Y,X]$
3. A likelihood ratio corresponds to a logLikelihood difference, $$\log\left(\frac{L[\theta_1|Y,X]}{L[\theta_0|Y,X]}\right) = \frac{\log L[\theta_1|Y,X]}{\log L[\theta_0|Y,X]} = \log L[\theta_1|Y,X] - \log L[\theta_0|Y,X]$$.

***
</details>

Likelihood and maximum likelihood estimation are central concepts in statistics. Many statistical tests and methods uses or is based on the concept of maximum likelihood.

(In the following, I will simplify notation and not differentiate between etimates and random variables, e.g., $\theta$ will be used also for $\widehat\theta$.)

</details>

## Likelihood | `Likelihood and OLS for linear models`

<details>
<summary> Lecture notes </summary>

So, why have we used ordinary least squares (OLS), i.e., minimization of  RSS when estimating linear model parameters $\beta$ rather than maximum likelihood estimation?

Linear models is a special case with some nice properties when it comes to  likelihood. Consider a simple linear regression model,

$$ y = \beta x + \epsilon, $$

where the residuals $\epsilon\sim N(0,\sigma^2)$. 

It turns out that the  likelihood estimates of both $\beta$ and $\sigma^2$ are functions of the  RSS of the residuals, so that the likelihood can be approximated by

$$  \log L[\beta, \sigma^2|Y,X] \approx -\frac{N}{2} \log RSS$$

<details>
<summary> Extra Reading </summary>

The likelihood for given $\beta$ and $\sigma^2$, given observed data $Y$ and $X$ is given by

$$ L[\beta, \sigma^2|Y,X] = \prod_i pdf_{Normal}(y_i, \mu=\beta x_i, \sigma^2=\sigma^2) = \prod_i \frac{1}{\sqrt{2\pi \sigma^2}}e^{-\frac{(y_i-\beta x_i)^2}{2\sigma^"}} $$

where $pdf_{Normal}$ denotes the probability distribution function for the Normal distribution. If we work with the logLIkelihood instead, we get 

$$\begin{eqnarray*}
\log L[\beta, \sigma^2|Y,X] 
&=& \sum_{i=1}^N \log\left(\frac{1}{\sqrt{2\pi \sigma^2}}e^{-\frac{(y_i-\beta x_i)^2}{2\sigma^2}}\right)\\
&=&   \sum_{i=1}^N \log \left(\frac{1}{\sqrt{2\pi \sigma^2}}\right) -\frac{(y_i-\beta x_i)^2}{2\sigma^2} \\
&=&   N\log \left(2\pi \sigma^2\right)^{-1/2} -\frac{\sum_{i=1}^N (y_i-\beta x_i)^2}{2\sigma^2} \\
&=&   -\frac{N}{2}\log \left(2\pi \sigma^2\right)  -\frac{RSS}{2\sigma^2}
\end{eqnarray*}$$

We see here that minimizing $RSS$ (as in OLS) will maximize the logLikelihood, regardless of the value of $\sigma^2$. Moreover, it turns out that also $\sigma^2$ can be estimated fairly well by $RSS/N$. Hence, we get 

$$\begin{eqnarray*}
\log L[\beta, \sigma^2|Y,X]
&=&   -\frac{N}{2}\log \left(\frac{2\pi RSS}{N}\right)  -\frac{N}{2}\frac{RSS}{RSS}\\
&=&   -\frac{N}{2}\log RSS + \frac{N}{2}\log \frac{2\pi}{N} -\frac{N}{2}\\
&=&   -\frac{N}{2}\log RSS + C
\end{eqnarray*}$$
where $C=\frac{N}{2}\left(\log \frac{2\pi}{N} -1\right)$ is a constant that is usually ignored (in likelihood ratios, which is equivalent to log likelihoods differences, it will disappear).

***
</details>

This means that the maximum likelihood estimates of $\beta$ is exactly the same as those of the minimum RSS.

_**NB!** This is a special case for linear models and are not generally true for other models. For example, logistic regression is typically fitted using maximizing the likelihood _

In general, full-on likelihood computation and maximum likelihood estimation is relatively slow, so alternative and faster methods has been developed, e.g., OLS.

</details>

## Bayesian approach

<details>
<summary> Lecture notes </summary>

Bayes' theorem (Thomas Bayes, 1702-1761) provides a way to obtain the requested $P[\theta|X,Y]$


$$Pr[\theta|D] = \frac{Pr[D| \theta]Pr[\theta]}{Pr[D]}$$
**Posterior probability**

$Pr[\theta|D],$ the probability, computed posterior to analysis, of the parameters $\theta$ conditioned on the observed data, i.e, our requested probability.

An important characteristic of Bayesian statistics is that the focus is not on point estimates, but on the posterior probability distribution over the parameter space of $\theta$, which provides a measure of uncertainty (probabilities) in comparison to other values.

<img src="session-regularization_files/figure-html/unnamed-chunk-1-1.png" width="100%" />

**Prior probability of $\theta$**

$Pr[\theta]$ is the *prior* probability of $\theta$ and should according to Bayesian statistics reflect what we know (or believe to know) about how close $\theta$ is to the true parameters. We can use information from previous studies or we can assign a *uninformative* prior, e.g., $Pr[\theta]$ follows a uniform distribution for all $\theta$ in the interval $[a,b]$. 

It can be shown that the effect of the prior on the posterior probsbiity is largest when the observed data is small. With larger sample sizes, the posterior probability will eventually just depend on $Pr[D|\theta]$.

**Marginal Probability of $D$**

$Pr[D]=\int_{\theta}Pr[D| \theta]Pr[\theta]$ is the probability of $D$ regardless of $\theta$. This can often be difficult difficult to calculate and, for this reason, Bayesian models are often designed so that this can be calculated analystically or some approximation approach, such as Markov chain Monte Carlo (MCMC) is used.

<details>
<summary> Extra reading </summary>

**Probabilistic algebra**

A conditional probability $Pr[A|B]$ is the probability that $A$ happens if we know that $B$ has happened.
To obtain the probability that both $A$ and $B$ happens we need to first take the probability that $B$ happens and then multiply it with the conditional probability that $A$ hapens given $B$, i.e.,:

$$Pr[A,B] = Pr[A|B] Pr[B].$$

From this follows the reverse operation

$$\frac{Pr[A,B]}{Pr[B]} = Pr{A|B}$$
Notice that this also works if we have more than one condition:
 $Pr[A|B,C] * Pr[B] = Pr[A,B|C].$



What happens in Bayes rule is that we first, in the numerator, perform $Pr[B|A]*Pr[A] = Pr[A,B]$ and then divide this with the denominator $\frac{Pr[A,B]}{Pr[B]} = Pr[A|B]$.

***

</details>

***

</details>

## Bayesians vs frequentists

<details>
<summary> Lecture notes </summary>

There is often described a severe controversy between Bayesians and frequentists. However, this controversy represents the extreme hardcore Bayesians and frequentists.

In reality, there is a large gray-zone where frequentists and Bayesians meet and socialize:

* Bayesian models can be viewed as a type of the hierarchical models often used by frequentists
* Frequentist bootstrap analysis is often used to estimate uncertainty of point estimates in relation to alternatives, as is done in Bayesian statistics
* The *Bayes factor* is a Bayesian  version of the likelihood ratio
* Bayesian *posterior intervals* corresponds to frequentist *confidence intervals* (*Note* however, that there are no Bayesian significance test)
* etc.

Most practical statisticians use the tool that is adequate for the problem at hand, whether it is Bayesian or frequentist.

***
</details>


#  Overfitting

We will now look at a general problem in statistical modeling that can be visualized quite well with Likelihoods. We will later look at some solutions to this problem.

## Overfitting | `Example data`

First, you need some test data to play around with. For simplicity and convenience, you will simulate a toy data from a linear model and use this in the exercises. The advantage for us using simulated data is that we know the 'truth', i.e., how the data was simulated and we therefore have *oracle knowledge* about the true parameter values, e.g., for $\beta$.

### Task | `simulation of example data`
* The data should comprise 100 samples. 
* First generate 10 variables $(x_1,x_2,\ldots, x_{0})$ from a uniform distribution (use the function `runif`) and store them in a Matrix $X$. 
* Use an intercept $\beta_0=3$ 
* Generate effect sizes $\beta_1, \beta_2, \beta_3$ from a Uniform distribution in the interval $(0.5, 1.0)$ for the 3 first $X$ variable (use the function `runif`); record the 'true' effect sizes for reference.
* Finally generate outcome variable $Y$ using a linear model $Y = \beta_0 + \beta_1 x_i + \beta_2 x_2 + \beta_3 x_3 + \epsilon$, with $\epsilon\sim N(0,\sigma^2=1)$ (i.e., the residuals are drawn from a Normal distribution with mean=0 and standard deviation=1, *Tip:* use the R function `rnorm`).


```r
# To obtain exactly the same result as in the demo, set seed to 85
set.seed(85)
```


```r
N=100 # number of samples
P=10 # number of variables

# Draw variables, x_{i,1},...,x_{i,P} for all N individuals, from a uniform distribution in interval (0,1) (this is the default interval for runif)
X=matrix(round(runif(N*(P+1),min=0, max=2)), nrow=N, ncol=P)

# generate a y variable from a multivarite lm of 3 first X variables only
# intercept
b0=3
# effect sizes for first three variables
b=c(runif(3, min=0.5, max=1.0))

# generate y
Y <- b0 + X[,1] * b[1] + X[,2] * b[2] + X[,3] * b[3] + rnorm(N)
```

#### Think about:

* What can simulation be used for?

<details>
<summary> Some possible answers </summary>
<h4>Some possible answers</h4>

* Oracle knowledge when evaluating performance of methods, e.g., Type I and II errors 
* Estimating probabilities and probability distributions of, e.g., data and summary statistics of data

***

</details>
## Overfitting | `Model comparison`

Now consider the following two models for our data

\begin{eqnarray}
y & \sim & \beta_0 + \beta_1 x_1 & (1) \\
y & \sim &  \beta_0 + \beta_1 x_1 + \beta_2 x_2 & (2)
\end{eqnarray}

What are the max Likelihood estimates of the two models? (we can use the R function `logLik` in the `stats` package)

### Task | `plot two likelihoods`
* Create `lm` models for the two models, and
* store the likelihood (use `logLik`) in a vector
* plot the likelihoods


```r
require(stats)
ll= vector()
for(i in seq(1,2)){
  Xi=X[,seq(1,i)]
  ll[i] <- logLik(lm(Y~Xi))
}
# plot likelihoods for models with 1 and 2 vaiables
plot(ll, ylab="log L", xlab="model #", type = "b", xlim=c(1,P), ylim=c(floor(min(ll)),ceiling(max(ll)))) 
# xlim and ylim not really necessary here, but I can reuse the plot statement below, so the plots look similar
```

<details>
<summary> *Show result*</summary>
<img src="session-regularization_files/figure-html/unnamed-chunk-5-1.png" width="100%" />

***
</details>

... 2 variables are clearly better than 1 variable -- What if we add more variables?

### Task | `plot all likelihoods`

* Now repeat this for the sequence of models obtained by creating the next model by simply adding the next $X$ variable in order.


```r
# compute loglikelihood (ll) for all models including variables
# 1-i, for i <= P; store results in vector ll
ll= vector()
for(i in seq(1,P)){
  Xi=X[,seq(1,i)]
  ll[i] <- logLik(lm(Y~Xi))
}

# plot ll for all models
plot(ll, ylab="log L", xlab="model #", type = "b", xlim=c(1,P), ylim=c(floor(min(ll)),ceiling(max(ll)))) 
```

<details>
<summary> *Show result*</summary>
<img src="session-regularization_files/figure-html/unnamed-chunk-7-1.png" width="100%" />

***
</details>

#### Think about:

* How does the Likelihood behave as more variables are added?

* Which is the maximum likelihood model? Is this correct given our *oracle knowledge*?

* What could be the problem with this behaviour? How would we like it to behave?

* How can we obtain the desired behaviour?

<details>
<summary> Some possible answers </summary>
<h4>Some possible answers</h4>
_Nested models_

* Model (1) can be described as a special case of Model (2) with the constraints on $\beta_2=0$

* Therefore Model (2) will always have equal or better ML than Model (1)


_Overfitting_

* Using our *oracle knowledge*, we know that the simulated data was generated from the 3 first variables
  + thus, the subsequent variables increase ML by modeling noise in data
  
* This is difficult to detect by just looking at the likelihoods

* Solutions
  + Seek the simplest model that is "good enough" -> Regularization

***
</details>


<details>
<summary> Extra Reading </summary>
<h2> Model comparison | `Likelihood ratio test`</h1>

For nested models $-2 \max LRT$ is $\chi^2(d)$-distributed, with $d=$ the difference in free params in the two models.

<table class="table table-striped" style="font-size: 14px; width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Compared models </th>
   <th style="text-align:right;"> logL 1st model </th>
   <th style="text-align:right;"> logL 2nd model </th>
   <th style="text-align:left;"> logLR </th>
   <th style="text-align:left;"> P-value </th>
   <th style="text-align:left;"> Sign at 0.05 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 vs 2 variables </td>
   <td style="text-align:right;"> -155.80 </td>
   <td style="text-align:right;"> -146.90 </td>
   <td style="text-align:left;"> -8.9 </td>
   <td style="text-align:left;"> 2.45e-05 </td>
   <td style="text-align:left;"> yes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 vs 3 variables </td>
   <td style="text-align:right;"> -146.90 </td>
   <td style="text-align:right;"> -136.73 </td>
   <td style="text-align:left;"> -10.17 </td>
   <td style="text-align:left;"> 6.48e-06 </td>
   <td style="text-align:left;"> yes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 vs 4 variables </td>
   <td style="text-align:right;"> -136.73 </td>
   <td style="text-align:right;"> -136.69 </td>
   <td style="text-align:left;"> -0.04215 </td>
   <td style="text-align:left;"> 0.772 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 vs 5 variables </td>
   <td style="text-align:right;"> -136.69 </td>
   <td style="text-align:right;"> -136.23 </td>
   <td style="text-align:left;"> -0.4601 </td>
   <td style="text-align:left;"> 0.337 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 vs 6 variables </td>
   <td style="text-align:right;"> -136.23 </td>
   <td style="text-align:right;"> -135.83 </td>
   <td style="text-align:left;"> -0.4016 </td>
   <td style="text-align:left;"> 0.37 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 vs 7 variables </td>
   <td style="text-align:right;"> -135.83 </td>
   <td style="text-align:right;"> -135.35 </td>
   <td style="text-align:left;"> -0.4803 </td>
   <td style="text-align:left;"> 0.327 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 vs 8 variables </td>
   <td style="text-align:right;"> -135.35 </td>
   <td style="text-align:right;"> -135.31 </td>
   <td style="text-align:left;"> -0.04266 </td>
   <td style="text-align:left;"> 0.77 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 vs 9 variables </td>
   <td style="text-align:right;"> -135.31 </td>
   <td style="text-align:right;"> -135.30 </td>
   <td style="text-align:left;"> -0.0002981 </td>
   <td style="text-align:left;"> 0.981 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 vs 10 variables </td>
   <td style="text-align:right;"> -135.30 </td>
   <td style="text-align:right;"> -134.55 </td>
   <td style="text-align:left;"> -0.7536 </td>
   <td style="text-align:left;"> 0.22 </td>
   <td style="text-align:left;"> no </td>
  </tr>
</tbody>
</table>
In our simple test case, the LRT also succeed in picking the correct model. It should be noted that certain issues, such as *lnkage disequiibriium*, may cause problems for LRT (*the example is not optimized to show this*).


***
</details>

#  Regularization

<details>
<summary> Lecture notes </summary>

Regularization is a concept that adds auxiliary criteria, so-called *regularization terms*,  to probabilistic models.  This is called regularized likelihood models or penalized likelihood models. Typically, the regularization term is a function of parameters $\beta$:

$$\log rL[\beta | X, Y]  = \log Pr[Y | X, \beta] - f(\beta),$$


A very simple regularized likelihood model uses $f(\beta) = \#\beta = \#X$, that is the number of $X$ variables.  
$$\log rL[{\beta} | X, Y]  = \log Pr[Y | X, {\beta}] - \#X, $$


Applying this rL to our example data, solves the overfitting problem.


```r
# compute loglikelihood (ll) for all models including 1-P variables
pl= vector() 
for(i in seq(1,P)){
  xi=X[,seq(1,i)]
  xi=cbind(rep(1,N), xi)
  fit = lm(Y~xi)
  # To make the code simple, we forestall next step and use the AIC function here
  # AIC= -2(pl) so convert back
  pl[i] = -AIC(fit)/2
}
# plot ll of all models
plot(pl, xlim=c(1,P), ylim=c(floor(min(pl)),ceiling(max(pl))),ylab="log pL", xlab="model #", type = "b")
```

<img src="session-regularization_files/figure-html/unnamed-chunk-8-1.png" width="100%" />

</details>

## Regularization | `Bayesian interpretation`
<details>
<summary> Lecture notes </summary>

Regularization is a canonical example where Bayesian and frequentist statistics meet.

The standard way of writing a regularized likelihood is using the logLikelihood, but what if 'de-log' it:

\begin{eqnarray*}
\log rL[\beta | X, Y]  &=& \log Pr[Y | X, \beta] - f(\beta) \\
\Downarrow\\
rL[\beta | X, Y]  &=& Pr[Y | X, \beta] * e^{- f(\beta)}
\end{eqnarray*}

This looks suspiciously like an un-normalized posterior probability (i.e., lacking the denominator), with an exponential prior $Pr[\beta]=e^{-f(\beta)}.$

As we will see examples of, most regularization techniques have a Bayesian interpretation.


In fact, a standard solution overfitting and, more generally, over-parameterization, i.e., problems where the likelihood function may not have a unique maximmum, is to include prior information, either as Bayesian priors or regularization terms to limit the parameter space. This is an area where Bayesian and frequentist socialize and get on well.

</details>


##  Regularization | `AIC and model testing`

<details>
<summary> Lecture notes </summary>

Coming from a _information theory_ base, Hirotugu Akaike came up with a very similar approach for the overfitting problem.

The Akaike information criterion (AIC), for a model $m$ with variables $X$, is defined as

  $$AIC_m = 2\# X - 2\log \max L[{\beta}|X,Y]$$

We see that $AIC_m = -2 \left(\log \max L[{\beta}|X,Y] - \#X\right)$, i.e., $-2$ times the the simple $\log rL$, we just looked at in our first regularization example. 
    
<details>
<summary> Extra Reading </summary>

The difference in $AIC$ between two models is claimed to estimate the information lost by selecting the worse model.

***
</details>
    
Sometimes, the *relative likelihood* for model $m$ is used, which is
      $$relL = e^\frac{ AIC_{min} - AIC_{m} }{2}$$
where $AIC_{min}$ is the minimum AIC among a set of compared models
      
<details>
<summary> Extra Reading </summary>

* $relL$ can be interpreted as proportional to the probability that the model $m$ minimizes the information loss.
<!--       and can be interpreted as -->
<!-- $rL \propto Pr[m\textrm{ minimizes estimated information loss}]$. -->

   * Notice that
   
$$\log relL = \frac{\#X_m }{\#X_{min}}\log\frac{\max L[{\beta}_{m}|X_m,Y]}{\max L[{\beta}_{min}|X_{min},Y]}$$
  we see that $rL$ can be viewed as a  likelihood ratio weighted by the ratio of number of $X$ variables.
* However, AIC are not limited to nested models

***
</details>

</details>

### Task | `AIC analysis`

* A typical strategy is to select the model, $m$ with $AIC_m=AIC_{min}$ and then evaluate how much better it is than the other candidate models, e.g., using the $relL$.

* Apply this AIC strategy applied to our example data using the R funcion `AIC`
* create a table with the AIC and the $relL$ for the set of models comprising $\{X_1, .\ldots, X_i\} \textrm{ for } i \in [1, \ldots, 10]$; indicate also if a model is the minimum AIC model.


```r
require(stats) 
require(dplyr)      # used for nice table formatting
require(kableExtra) # used for nice table formatting

mprev <- lm(Y ~ X[,1]) # current miminimum AIC model
# dummyentry to be replaced
aic=data.frame(models=0, aic=0, isAICmin="-") 

for(i in seq(1,P)){
  m <- lm(Y ~ X[,seq(1,i)])
  fit = AIC(mprev,m)
  mprev = m
  if(i==2){ #include also the first model
    aic[i-1,] = list(paste0(i-1," variable"), signif(fit$AIC[1],5), "-") 
  }
  aic[i,] = list(paste0(i," variables"), signif(fit$AIC[2],5), "-") 
}
minaic=min(aic$aic)
aic$rl=format(exp((minaic-aic$aic)/2), digits=4)
aic$isAICmin = ifelse(aic$aic==minaic,"Yes","-")

kable(aic, format='html', row.names=F, col.names=c("Compared models","AIC","Minimum AIC","rL"),digits=30,format.args=list(snsmall=0))  %>%  kable_styling( font_size = 14)
```

<details>
<summary> *Show result*</summary>
<table class="table" style="font-size: 14px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Compared models </th>
   <th style="text-align:right;"> AIC </th>
   <th style="text-align:left;"> Minimum AIC </th>
   <th style="text-align:left;"> rL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 variable </td>
   <td style="text-align:right;"> 317.61 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 3.841e-08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 variables </td>
   <td style="text-align:right;"> 301.80 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 1.041e-04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 variables </td>
   <td style="text-align:right;"> 283.46 </td>
   <td style="text-align:left;"> Yes </td>
   <td style="text-align:left;"> 1.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 variables </td>
   <td style="text-align:right;"> 285.38 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 3.829e-01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 variables </td>
   <td style="text-align:right;"> 286.46 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 2.231e-01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 variables </td>
   <td style="text-align:right;"> 287.66 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 1.225e-01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 variables </td>
   <td style="text-align:right;"> 288.70 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 7.280e-02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 variables </td>
   <td style="text-align:right;"> 290.61 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 2.802e-02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 variables </td>
   <td style="text-align:right;"> 292.61 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 1.031e-02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10 variables </td>
   <td style="text-align:right;"> 293.10 </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:left;"> 8.067e-03 </td>
  </tr>
</tbody>
</table>

***
</details>

* Try to plot the $AIC$ and the $reL$ with the different models on the $X$-axis


```r
require(stats)

# plot AIC of all models
plot(aic$aic, xlim=c(1,P), ylim=c(floor(min(aic$aic)),ceiling(max(aic$aic))),ylab="AIC", xlab="model #", type = "b")

# plot relL of all models
plot(aic$rl, xlim=c(1,P), ylab="relL", xlab="model #", type = "b")
```

<details>
<summary> *Show result*</summary>
<img src="session-regularization_files/figure-html/unnamed-chunk-12-1.png" width="100%" /><img src="session-regularization_files/figure-html/unnamed-chunk-12-2.png" width="100%" />

***
</details>

#### Think about:

* Which is the best model? Is this correct compared to our *oracle knowledge*?
* How good is it compared to the others?
* Can you see a drawback in our model testing approach above? If so, how can we solve that?


<details>
<summary> Some possible answers </summary>
<h4>Some possible answers</h4>

* We see that the best model is the one with the 3 first X-variables (in line with our *oracle knowledge*) and that the second best model (with the first 2 X-variabels) is $\approx70\%$ worse.

<details>
<summary> Extra Reading </summary>

* Sometimes it is desirable to compute a significance for rejecting a model in favour of another model. A NULL distribution for the $relL$ statistic is usally obtained through simulation, e.g., using parameteric bootstrapping.

***
</details>

* Now, I this case we happened to know that the first 3 variables was the right one, so the order we choose to include them was correct. However, in the general case, we do not know this. How solve this?
  - Best subset method; involves testing all possible subsets, which is computationally time-consuming and dometimes unfeasible
  - Lasso

***
</details>

##  Regularization | `LASSO and Feature selection`

<details>
<summary> Lecture notes </summary>

LASSO  stands for Least absolute shrinkage and selection operator ("shrinkage" is another common term for regularization) and is a method for selecting variables to include in a multivariate model.

Classical LASSO builds on RSS of a linear regression model $Y \sim X{\beta}$ with regularization

<details>
<summary> Extra Reading </summary>

Extensions to glms exists, but then using a regularized likelihood expression
    
***
</details>

The regularization term $f(\beta) = \lambda\sum_{\beta_i\in\beta} |\beta_i-0|= \lambda\sum_{\beta_i\in\beta} |\beta_i|$

<details>
<summary> Extra Reading </summary>

Often the regularization term is expressed in terms of the $\ell_1-norm$, which can be viewed simply a short-hand notation, e.g., the $\ell_1-norm$ of $\beta$ is
$$ ||\beta||_1 = \sum_{\beta_i\in\beta} |\beta_i|$$

There is also a $\ell_2-norm$:
$$ ||\beta||_2 = \sqrt{\sum_{\beta_i\in{\beta}} \beta_i^2}$$
which is used, e.g., in ridge regression.

We note, BTW, that you already have been working with an $\ell_2-norm$: since $RSS = ||Y-X\beta||_2^2$ is simply the square of the $\ell_2$ norm of the residuals.

***
</details>  
    
The $\lambda$ parameter sets a limit on the estimation of $\beta$. 


Lasso is traditionally described as RSS with an auxiliary criterion/constraint: 

$$min_{{\beta}}\left\{RSS\right\} + \lambda\sum_{\beta_i\in\beta} |\beta_i|.$$
Lasso can also be viewed as a un-normalized Bayesian posterior probability, with a LaPlacean prior on $\beta$: $\beta_j ∼ LaPlace(0, 1/\lambda)$ 

<details>
<summary> Extra Reading </summary>

Other common notation for LASSO:

* You might often see the notation $$min_{{\beta}}\left\{RSS\right\} \textrm{ subject to } ||{\beta}||_1 <= t$$
  where $t$ is related to $\lambda$.
* Lasso can also be viewed as a Bayesian posterior probability, with a LaPlacean prior on $\beta$: $\beta_j ∼ LaPlace(0, 1/\lambda)$ 

***
</details>

The optimal values of $\beta$ are then estimated, using some algorithm (lars or coordinate descent).

<details>
<summary> Extra Reading </summary>

The *Coordinate descent* algorithm is used in the R package `glmnet`:

1. Over a grid of $\lambda\in [0, \infty]$, do
    1. Start with all $\beta=0$
    2. until convergence repeat for each $\beta_i$
        1. while keeping all other $\beta$ fixed and $\beta_i=0$, compute partial residuals
        2. estimate $\beta_i$ by RSS on the partial residuals
        3. update $\beta_i using the RSS estimate and $\lambda$.
    
***
</details>
            
<details>
<summary> Extra Reading </summary>

Alternatives to LASSO, differing mainly in the auxiliary criterion

  - *Ridge regression* which uses a $\ell_2$ norm
  - *Elastic-net*, which uses a mixed model combination of the  $\ell_1$ norm and the $\ell_2$ norm.

*** 
</details>

</details>

### Task | `Lasso using the glmnet R-package`

* Use function `glmnet` to perform LASSO analysis on our example data; relevant arguments of the function:
    + linear regression (`family='gaussian'` = default)
    + LASSO (`alpha=1` = default)
    + standardization
        + The variables Y and X must be centered and standardized to ensure that all variables are given equal weight in the model selection.
        + standardization of $X$ to unit variance in `glmnet` is obtained  by setting the argument `standardize=TRUE` which is the default
        + the values of $Y$ is always standardized (?) for `family=gaussian` (LASSO)
         + and the coefficients are back-standardized before reported

<details> 
<summary> Extra Reading </summary>

Standardization in `glmnet`:
$x' = \frac{x-\bar{x}}{1/\sqrt{N}||X-\bar{x}||_2}$

***
</details>


```r
require(glmnet)
# run lasso (alpha=1) for linear model (family=gaussian)
fit = glmnet(X,Y, family="gaussian", alpha=1, standardize=T)
```

* A graphical way to view the result is to `plot` the paths of $\beta$ for increasing vaules of $\lambda$.


```r
par(mfrow=c(1,1))
plot(fit, xvar="lambda",label=T)
```

<details>
<summary> *Show result*</summary>
<img src="session-regularization_files/figure-html/unnamed-chunk-15-1.png" width="100%" />

***
</details>

#### Think about
* In which order are variables included (i.e., their $\beta$ becomes non-zero? 
* In which direction is the effect
* Which lambda should we select?
  - Given our *oracle knowledge*, where would an appropriate $\lambda$ be?
  - Can we use that?

<details>
<summary> Some possible answers </summary>

<h4>Some possible answers</h4>
* The order appears to be $(1,2,3,7,6,5,10,9,4,8)$
* $\beta_i > 0, i\in \{1,2,3,4,7,9\}$, while $\beta_i<0, i\in \{5,6,8,10\}$
* Given *oracle knowledge*, the correct $\lambda$ appears lie somewhere in the interval $[\approx \exp(-2.1), \approx\exp(-2.5)]$
* In the normal case, we do not have *oracle knowledge*.

***
</details>

## Cross-validation

<details>
<summary> Lecture notes </summary>

The LASSO model will be different depending on how we set $\lambda$. A problem is to decide the optimal $\lambda$ to use. 

* $\lambda$ too *high*: risk of missing relevant variables
* $\lambda$ too *low*: risk of overfitting 

`glmnet` addresses this using *$k$-fold cross-validation* -- what is that?

</details>

### Cross-validation | `How to test for overfitting`

<details>
<summary> Lecture notes </summary>

The ultimate way of testing an estimated model (with parameters) is to apply it to new data and evaluate how well it performs, e.g., by measuring the *mean squared error*, $MSE$ ($=RSS/N$).
Naturally, we want to minimize $MSE$, i.e., the error of the model. In our LASSO application, this means that we want to select the $\lambda$ that minimizes the $MSE$

In cross validation, this approach is emaulated by partioning the data at hand into a *training* and  *test* (or *validation*) data set. The model parameters are estimated ('trained') on the the training data and the validated on the test data.

By chance, this may fail if the partitioning is 'non-representative'. A solution is to repeat the cross-validation procedure with another partioning.

In $k$-fold cross validation, the original data is split into $k$ sub-datasets $\{D_1,D_2,\ldots, D_k\}$.
For $i \in \{1,2,\ldots, k\}$, set $D_i$ as the test data set and the union of the other datasets be the training data. Perform cross validation as above.

This gives a distribution of $MSE$ from which we can estimate, e.g., mean and standard deviation.

<details>
<summary>Additional reading</summary>

This distribution allows us to use more elaborate means to select $\lambda$. One common suggestion is to use the largest $\lambda$ whose $MSE$ is within 1 standard error from the minimum value (called `lambda.1se` in `glmnet`). The motivation argued for this choice is *parsimony*, in the sense that larger $\lambda$ will include fewer variables (hence it is parsimonious in terms of number of included variables). 

Here we will limit ourselves to finding the minimum $\lambda$, called `lambda.min` in `glmnet`, but anyone is free to test if `lambda.1se` gives a different result.

***
</details>

</details>

### Task | `Determine optimal LASSO `$\lambda$` using cross-validation`
* Use the function `cv.glmnet` to perform cross validation (same options as for `glmnet`)
* `plot` the cross-validation results 
* Compare with the plot of estimated $\beta_i$ under different $\lambda$.
* Determine the optimal $\lambda$ (the one with minimal error)


```r
require(glmnet)
par(mfrow=c(1,1))
# run lasso (alpha=1) for linear model (family=gaussian)
cvglm=cv.glmnet(X,Y, family="gaussian", alpha=1, standardize=T, nfolds=100)

plot(cvglm)
plot(cvglm$glmnet.fit, xvar="lambda",label=T)
minlambda=cvglm$lambda.min
```

<details>
<summary> *Show result*</summary>
<img src="session-regularization_files/figure-html/unnamed-chunk-17-1.png" width="100%" /><img src="session-regularization_files/figure-html/unnamed-chunk-17-2.png" width="100%" />

***
</details>

#### Think about
* Which is the $\lambda$ selected by `cv.glmnet`?
* Does this make sense given our *oracle knowledge*?

<details>
<summary> Some possible answers </summary>

<h4>Some possible answers</h4>
* Cross-validation-selected optimal lambda is 0.1064891
* Yes, this includes only the *oracle knowledge* correct variables $X_1, X_2, X_3$

***
</details>

### Task| `Final LASSO effect sizes`
* Finally print a table with the $\beta$ coefficients (including the intercept, $\beta_0$) for the optimal model (i.e.,  at minimum $\lambda$). (Use function`coef`).


```r
# Actually the following suffice for output on console
#coef(cvglm, s="lambda.min")

# But to get a nice table:
require(dplyr)      # for nice table
require(kableExtra) #for nice table

coefglm=as.data.frame(as.matrix(coef(cvglm, s="lambda.min")))
coefglm=cbind(seq(0,10),c(b0, b, rep(0, 7)),coefglm)
names(coefglm)=c("beta","value (oracle)", paste0("estimate(lambda=",signif(minlambda,3),")"))
kable(coefglm, row.names=F) %>%   kable_styling( font_size = 14)
```

<details>
<summary> *Show result*</summary>

<table class="table" style="font-size: 14px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> beta </th>
   <th style="text-align:right;"> value (oracle) </th>
   <th style="text-align:right;"> estimate(lambda=0.106) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3.0000000 </td>
   <td style="text-align:right;"> 3.6046135 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.8125118 </td>
   <td style="text-align:right;"> 0.5905522 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.6009469 </td>
   <td style="text-align:right;"> 0.4631531 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.7232911 </td>
   <td style="text-align:right;"> 0.5204561 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
</tbody>
</table>

***
</details>

#### Think about
* Does the effect sizes make sense -- if not can you think of why?

<details>
<summary> Some possible answers </summary>
<h4>Some possible answers</h4>

* Well...yes!
  + $\beta_i$ is non-zero only for _oracle_-known variables $X_1, X_2, X_3$
  + they don't exactly equate our *oracle knowledge* parameter values -- they appear to be scaled.
  + but their relative order of amplitude is right.
* Perhaps the normalization affected scaling.

***
</details>



For practicing the concept of Feature Selection, we will use the skeletal muscle gene expression subset (randomly sampled 1000 genes) from GTEX Human Tussue Gene Expression Consortium [3]. Here we load the gene expression matrix X, remove lowly expressed genes and pre-view it:


```
##                         ENSG00000243824.1_RP11-434O22.1
## GTEX-N7MS-0426-SM-2YUN6                               2
## GTEX-NFK9-0626-SM-2HMIV                               0
## GTEX-NPJ8-1626-SM-2HMIY                               0
## GTEX-O5YT-1626-SM-32PK6                               0
## GTEX-OHPM-1626-SM-2HMK4                               0
##                         ENSG00000140527.10_WDR93 ENSG00000205352.6_PRR13
## GTEX-N7MS-0426-SM-2YUN6                        2                     543
## GTEX-NFK9-0626-SM-2HMIV                        0                    1482
## GTEX-NPJ8-1626-SM-2HMIY                        3                    1958
## GTEX-O5YT-1626-SM-32PK6                        0                    1174
## GTEX-OHPM-1626-SM-2HMK4                        7                    1092
```

```
## [1] 157 546
```

We can see that the gene expression data set includes p = 546 expressed genes (features) and n = 157 samples, i.e. p >> n. The phenotype of interest we are going to address is Gender, i.e. we will figure out which of the 546 genes expressed in human skeletal muscles drive the phenotypic difference between Males and Females. Thus our response Y vector is the following:


```
##    Length     Class      Mode 
##       157 character character
```

```
## [1] 157
```

The data set used here includes 99 Males and 58 Females, it is not perfectly balanced but still not too bad. To visualize the samples, let us display a PCA plot of the 157 samples.


```
## Eigenvalues for the first 10 principal components, see object$sdev^2: 
##         PC1         PC2         PC3         PC4         PC5         PC6 
## 11979554198  1922793376   470907790   173035873    83960716    38937526 
##         PC7         PC8         PC9        PC10 
##    29568540    24951919    19376723    17467325 
## 
## Proportion of explained variance for the first 10 principal components, see object$explained_variance: 
##         PC1         PC2         PC3         PC4         PC5         PC6 
## 0.804731856 0.129164496 0.031633439 0.011623761 0.005640098 0.002615646 
##         PC7         PC8         PC9        PC10 
## 0.001986280 0.001676156 0.001301640 0.001173375 
## 
## Cumulative proportion explained variance for the first 10 principal components, see object$cum.var: 
##       PC1       PC2       PC3       PC4       PC5       PC6       PC7       PC8 
## 0.8047319 0.9338964 0.9655298 0.9771536 0.9827937 0.9854093 0.9873956 0.9890717 
##       PC9      PC10 
## 0.9903734 0.9915467 
## 
##  Other available components: 
##  -------------------- 
##  loading vectors: see object$rotation
```

<img src="session-regularization_files/figure-html/PCA-1.png" width="100%" /><img src="session-regularization_files/figure-html/PCA-2.png" width="100%" />

The PCA plot demonstrates that there is a lot of variation between samples with respect to both PC1 and PC2, but there is no clear seggregation of Males and Females based on their skeletal muscle gene expression data. Now we are going to start with a simple gene-by-gene univariate feature selection and extend it to a multivariate features selection with different methods.



<br><br><br>

# Thank you

##Session info

**R version 4.0.2 (2020-06-22)**

**Platform:** x86_64-apple-darwin17.0 (64-bit) 

**locale:**
en_US.UTF-8||en_US.UTF-8||en_US.UTF-8||C||en_US.UTF-8||en_US.UTF-8

**attached base packages:** 
_stats_, _graphics_, _grDevices_, _utils_, _datasets_, _methods_ and _base_

**other attached packages:** 
_pander(v.0.6.3)_, _mixOmics(v.6.12.2)_, _ggplot2(v.3.3.2)_, _lattice(v.0.20-41)_, _MASS(v.7.3-53)_, _glmnet(v.4.0-2)_, _Matrix(v.1.2-18)_, _dplyr(v.1.0.2)_, _kableExtra(v.1.2.1)_, _lmtest(v.0.9-38)_, _zoo(v.1.8-8)_ and _knitr(v.1.30)_

**loaded via a namespace (and not attached):** 
_Rcpp(v.1.0.5)_, _tidyr(v.1.1.2)_, _corpcor(v.1.6.9)_, _digest(v.0.6.26)_, _foreach(v.1.5.0)_, _RSpectra(v.0.16-0)_, _R6(v.2.4.1)_, _plyr(v.1.8.6)_, _ellipse(v.0.4.2)_, _evaluate(v.0.14)_, _httr(v.1.4.2)_, _highr(v.0.8)_, _pillar(v.1.4.6)_, _rlang(v.0.4.8)_, _rstudioapi(v.0.11)_, _rmarkdown(v.2.3)_, _rARPACK(v.0.11-0)_, _labeling(v.0.3)_, _splines(v.4.0.2)_, _webshot(v.0.5.2)_, _stringr(v.1.4.0)_, _igraph(v.1.2.5)_, _munsell(v.0.5.0)_, _compiler(v.4.0.2)_, _xfun(v.0.17)_, _pkgconfig(v.2.0.3)_, _shape(v.1.4.5)_, _htmltools(v.0.5.0)_, _tidyselect(v.1.1.0)_, _tibble(v.3.0.3)_, _gridExtra(v.2.3)_, _codetools(v.0.2-16)_, _matrixStats(v.0.56.0)_, _viridisLite(v.0.3.0)_, _crayon(v.1.3.4)_, _withr(v.2.3.0)_, _grid(v.4.0.2)_, _gtable(v.0.3.0)_, _lifecycle(v.0.2.0)_, _magrittr(v.1.5)_, _scales(v.1.1.1)_, _stringi(v.1.5.3)_, _farver(v.2.0.3)_, _reshape2(v.1.4.4)_, _xml2(v.1.3.2)_, _ellipsis(v.0.3.1)_, _generics(v.0.0.2)_, _vctrs(v.0.3.4)_, _RColorBrewer(v.1.1-2)_, _iterators(v.1.0.12)_, _tools(v.4.0.2)_, _glue(v.1.4.2)_, _purrr(v.0.3.4)_, _parallel(v.4.0.2)_, _survival(v.3.2-3)_, _yaml(v.2.2.1)_, _colorspace(v.1.4-1)_ and _rvest(v.0.3.6)_
