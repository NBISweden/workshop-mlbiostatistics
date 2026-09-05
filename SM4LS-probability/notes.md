# Outline

<!-- Teaching draft: approximately 50 minutes, with extensions to 60.

Suggested timing:
- Opening: 5 minutes
- Uncertain observations: 7 minutes
- Probability models: 14 minutes
- Repeated sampling: 13 minutes
- Precision and handover: 11 minutes

Ask for predictions before revealing calculations or graphs.
Use only 3–4 opening questions live; keep the rest as prompts.
H2 headings can become slides later.

Requires Quarto, R and knitr. Plots use base R only.
All numerical height parameters are hypothetical. -->

## Why do we care about probability?

\*Do experiments give different results?

Two research groups independently sample individuals from the same population, e.g. PhD students taking a life science course and measure the same biological outcome, e.g. height.

Their sample means are 172 and 175 cm.

**Could this difference arise simply because they sampled different individuals?**

Let's discuss:

- What information would help you answer?
- Would a difference of 3 cm be surprising if individual heights varied very little? What if they varied a lot?
- Would your answer change if each group studied 5 individuals rather than 100?
- If we repeated this study many times, would we always get the same sample mean?
- -What exactly is the population we want to learn about?
- How were the students selected? Could the selection process systematically favour taller or shorter people?
- Were heights measured in the same way in both groups?
- How could we describe which sample means are common and which are unusual?

Terms that may/should come up during discussion

- population, sample
- sample size
- biological variability, variance, SD
- sampling variability
- random variable, sampling distribution
- sample size, SE
- selection bias, measurement error
- probability model, assumptions

Message:

Different samples from the same population can give different results. Probability models help us describe how much sampling variation to expect—and which results would be unusual under our assumptions.

| Discussion point                                        | Key terms                                            | Connection to your session                                            |
| ------------------------------------------------------- | ---------------------------------------------------- | --------------------------------------------------------------------- |
| Who do we want to learn about, and whom did we measure? | **Population, sample**                               | Define what is being sampled.                                         |
| Individual heights differ                               | **Biological variability, variance, SD**             | Describe the spread of measurements.                                  |
| Different samples give different averages               | **Sampling variability, statistic**                  | A sample mean is not a fixed population property.                     |
| Repeating the study produces many means                 | **Random variable, sampling distribution**           | Describe the possible sample means and their probabilities.           |
| Larger samples tend to give more stable means           | **Sample size, SE, precision**                       | Distinguish variation among individuals from variation among means.   |
| Selection or measurement methods differ                 | **Selection bias, measurement error**                | Recognise that random sampling is not the only source of differences. |
| Which results would be unusual?                         | **Probability model, assumptions, tail probability** | Prepare for statistical inference.                                    |
