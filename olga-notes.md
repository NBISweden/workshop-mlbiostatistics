# ToDo

## Logistics

- split students into groups
- adjust quizzes
- adjust feedback form

## Welcome

- (done) add explanation about chapters v.s presentations
- (done) add note about lunches

## Descriptive statistics

- (done) check if code is available
- (done) add gtsummary() examples and to exercises 

## Wednesday

10:00 - 11:00 Introduction to supervised learning with KNN-classifier

Objectives:

- understand difference between supervised vs. unsupervised learning
- being able to run KNN classifier with data splitting and outcome evaluation

11:00 - 12:00 Introduction to linear models

- what linear models are
- simple linear regression demo
- slope / intercept
- hypothesis testing
- vector-matrix notations

12:00 - 13:00 lunch

13:00 - 14:30 Linear models: regression and classification

- checking model assumptions
- assessing model fit
- linear model selection & regularization
- GLM: logistic regression, Poisson regression
- Logistics Lasso?

14:30 - 15:00 break
15:00 - 16:00 Linear models exercises

- common cases
- putting into ML context (regression, regularized regression)

## Thursday

10:00 - 12:00 Linear models: common cases (go through together)
12:00 - 13:00 lunch
13:00 - 14:30 PCA
14:30 - 15:00 break
15:00 - 16:30 Clustering

## Friday

10:00 - 12:00 Putting everything together with tidymodels
12:00 - 13:00 lunch
13:00 - 14:30 Random Forest

ChatGPT

Creating a structured and engaging 30-minute presentation on an introduction to supervised learning can provide a solid foundation for understanding this key concept in machine learning. Here’s an outline that covers the basics, introduces core concepts, and includes examples to help illustrate the principles:

### Presentation Outline: Introduction to Supervised Learning

#### Slide 2: Overview of Machine Learning
- Definition of machine learning
- Brief description of the types of machine learning: Supervised, Unsupervised, and Reinforcement Learning

#### Slide 3: What is Supervised Learning?
- Definition of supervised learning
- Key characteristics of supervised learning
- Contrast with unsupervised learning

#### Slide 4: How Supervised Learning Works
- Overview of the process (Training Data -> Learning Algorithm -> Model)
- Explanation of training data (features and labels)

#### Slide 5: Types of Supervised Learning
- Classification
  - Definition and when to use it
  - Example: Email spam detection
- Regression
  - Definition and when to use it
  - Example: Housing price prediction

#### Slide 6: Data Collection and Preparation
- Importance of data in machine learning
- Steps in data collection and cleaning
- Example of a simple dataset

#### Slide 7: Splitting Data
- Explanation of training set and test set
- Importance of data splitting
- Cross-validation (brief mention)

#### Slide 8: Choosing the Right Algorithm
- Factors influencing the choice of algorithm
- Brief overview of popular algorithms:
  - Linear regression
  - Logistic regression
  - Decision trees

#### Slide 9: Model Training
- Explanation of how models are trained
- Importance of feature selection
- Overfitting vs. underfitting

#### Slide 10: Model Evaluation
- Metrics for performance evaluation
  - Accuracy, precision, recall for classification
  - MSE, RMSE for regression
- Importance of model evaluation

#### Slide 11: Improving Model Performance
- Techniques for improving performance
  - Feature engineering
  - Hyperparameter tuning

#### Slide 12: Practical Example: Building a Simple Classifier
- Step-by-step example using a simple dataset (e.g., Iris dataset)
- Tools and code snippets (e.g., Python with scikit-learn)

#### Slide 13: Applications of Supervised Learning
- Real-world applications in various industries
  - Healthcare, finance, marketing, etc.

#### Slide 14: Challenges in Supervised Learning
- Data quality and quantity issues
- Ethical considerations (bias, privacy)

#### Slide 15: Future Trends and Conclusion
- Brief discussion on the future of supervised learning
- Recap of key points
- Q&A

#### Slide 16: Additional Resources
- Books, courses, and websites for further learning
- Contact information for follow-up questions

### Tips for Presentation:
- Use clear, concise language and avoid jargon when possible.
- Include visual aids like diagrams and flowcharts to explain concepts.
- Provide real-world examples to help the audience relate to the material.
- Engage the audience with questions or quick activities related to the examples.

This outline will help you craft a comprehensive introduction to supervised learning that is informative and engaging for your audience.




- Linear: remove what linear models are and are not? Missing plus, and indices; change term to least-squares models?
- Linear: checking assumptions plots from lm() method, maybe focus more on that, explain Cook’s distance; add more examples, correlated measurements.
- Splitting presentation: checking assumptions, logistics regressions into two entries under Schedule 
- Linear: bring the same challenge from Tuesday but add age now






- Probability: add potential group exercises: log-normal, normal, binomial, negative binomial, omits: guess what is the distribution and what omics it comes from?
- Probability: add a note about transformations, scaling, normalisation
- Remove non-parametric session, move the correlation back to main on Tuesday main or Wednesday, add link to chapter.
- Tuesday competition: simulated data, find DEGs, log it, t-test, confidence intervals and/or demonstration
- Check quizzes for Tuesday after removing non-parametric session.
  

- Feature engineering & selection: check tidymodels
- Move intro to supervised to Wednesday morning, finish linear models with supervised example
- Thursday afternoon: feature selection, expand Lasso, logistic-Lasso; Friday more practical example with tidymodels, maybe not with tidymodels.


Wednesday
10 - 12: Introduction to supervised learning
12 - 16: Linear models I

Thursday
10 - 12: Linear models II
13 - 15: PCA
15 - 16: Clustering

