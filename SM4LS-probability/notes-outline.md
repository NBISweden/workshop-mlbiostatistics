## 1. Describe an uncertain observation

Questions:
- We randomly select a student. What height might we observe?
- What is the probability they are taller than 180 cm?
- Would knowing their height exceeds 170 cm change that probability?

Concepts:
- Random variable
- Events and complements
- Conditional probability
- Independence between observations

## 2. Describe the possible outcomes with a model

Questions:
- Suppose heights in a defined population are approximately normal.
  Which heights are common or unusual?
- Among 20 independently sampled students, how many might exceed 180 cm?

Concepts:
- Normal distribution
- Mean, variance and standard deviation
- Probability as area under a curve
- Standardisation and tail probabilities
- Binary indicators and binomial counts

## 3. Repeat the sampling

Questions:
- Sample 5 students and calculate their mean height.
  What happens if we repeat this many times?
- Do sample means vary as much as individual heights?
- What changes with 100 students per sample?

Concepts:
- Population versus sample
- Parameter versus statistic
- Sampling distribution
- Simulation
- Central limit theorem

## 4. Describe precision and prepare for inference

Questions:
- How variable are the sample means?
- How does sample size affect their variability?
- How unusual would a mean of 175 cm be under an assumed
  population mean of 172 cm, given the population SD and sample size?

Concepts:
- Standard deviation versus standard error
- SE of the mean: $\sigma/\sqrt{n}$ for independent observations
  with common variance
- Sample size and precision
- Probabilities for sample means under an assumed model

## Main distinction

- How unusual is a person's height?
  Compare with the distribution of individual heights.
- How unusual is a sample's mean height?
  Compare with the sampling distribution of the mean.

This prepares students for hypothesis testing in the next session.

## Teaching note

Use a hypothetical, clearly defined population for calculations.
Present normality as a modelling assumption, not a universal
property of height distributions.


---------

## 1. Describe an uncertain observation

Include:
- Define the population and imagine randomly selecting one student.
- Introduce height as a random variable, X, and an observed height as x.
- Use “height above 180 cm” as an event.
- Explain complements, conditional probability and independence.
- Discuss why the sampling procedure matters.

Key message:
A probability describes how likely an event is, given a specified
population, sampling process and any information we condition on.

Equations:
- Complement: P(Aᶜ) = 1 − P(A)
- Conditional probability: P(A | B) = P(A ∩ B) / P(B)
- For independent events: P(A ∩ B) = P(A)P(B)

Teaching emphasis:
Explain the equations in words and with height examples.
Avoid formal set theory and derivations.


## 2. Describe outcomes with probability models

Include:
- Show a hypothetical normal distribution of individual heights.
- Explain its centre (mean) and spread (variance and SD).
- Interpret probabilities as areas, including upper and lower tails.
- Introduce standardisation as distance from the mean in SD units.
- Briefly introduce the binomial distribution by counting students
  taller than 180 cm in a fixed-size independent sample.

Key message:
A probability model describes possible outcomes and their
probabilities. Its usefulness depends on its assumptions.

Equations:
- Normal model: X ∼ N(μ, σ²), where σ² is the variance
- Standardisation: Z = (X − μ) / σ
- Binomial model: K ∼ Binomial(n, π)
- Expected count: E[K] = nπ

Teaching emphasis:
Use plots and shaded areas.
Explain variance conceptually; no need to derive it.
Do not include normal-density or binomial-probability formulas.
Use π for the probability of exceeding the height threshold.


## 3. Repeat the sampling

Include:
- Distinguish population parameters from sample statistics.
- Draw a sample of students and calculate its mean height.
- Repeat to build a distribution of sample means.
- Compare individual heights with sample means.
- Compare repeated samples of 5 and 100 students.
- Introduce the central limit theorem intuitively.

Key message:
A sample mean is itself a random variable.
Its sampling distribution describes how it varies across studies.

Equations:
- Sample mean: X̄ = (1/n) Σᵢ Xᵢ
- Expected sample mean: E[X̄] = μ

Teaching emphasis:
Use a simulation with three stages:
population → one sample → many sample means.
Explain that the central limit theorem concerns sample means,
not individual observations becoming normal.
Mention independence and finite variance as conditions.


## 4. Describe precision and prepare for inference

Include:
- Define SE as the SD of a statistic’s sampling distribution.
- Distinguish individual variability (SD) from precision of a mean (SE).
- Explain how increasing independent sample size reduces SE.
- Distinguish known population SD, σ, from estimated sample SD, s.
- Locate an observed mean within its assumed sampling distribution.
- Return to the opening question about different study means.

Key message:
To judge how unusual a sample mean is, compare it with the
variation expected between sample means—not between individuals.

Equations:
- SE(X̄) = σ / √n
- Estimated SE(X̄) = s / √n
- Standardised mean: Z = (X̄ − μ₀) / (σ / √n)

Teaching emphasis:
The SE formula assumes independent observations with common variance.
The final Z statistic is standard normal under a normal population
with mean μ₀ and known σ; a large-sample approximation may also apply.
Show a tail probability without teaching formal rejection rules.

Handover:
Your colleague introduces hypotheses, p-values, confidence intervals
and the t-distribution when σ is estimated.