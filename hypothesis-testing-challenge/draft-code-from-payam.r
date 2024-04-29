set.seed(12) # for reproducibility
n <- 100 # number of subjects
n_variables <- 100 # total variables
n_de <- 20 # number of differentially expressed variables
n_de_age <- 5 # DE variables affected by age
mean_random<-20 # mean of random data

# Simulate subject data
subjects <- data.frame(
  subject_id = 1:n,
  age = rnorm(n, 50, 10), # assuming age follows a normal distribution
  group = factor(ifelse(runif(n) > 0.5, "Treatment", "Control"))
)

truth_random <- seq((n_de + 1),n_variables)
truth_DE_not_age_affected<-1:(n_de - n_de_age)
truth_DE_age_affected <- (n_de - n_de_age + 1):n_de

variable_data <- matrix(nrow = n, ncol = n_variables)

# Simulate random data
for(i in seq((n_de + 1),n_variables))
{
  for(gr in unique(subjects$group))
  {
    variable_data[subjects$group==gr,i]<-rnorm(sum(subjects$group==gr),mean = mean_random)
  }
}

# Simulate DE Variables Not Affected by Age 
for (i in 1:(n_de - n_de_age)) {
  variable_data[, i] <- rnorm(n, ifelse(subjects$group == "Control", mean_random, mean_random+i), 1)
}

# Simulate DE Variables Affected by Age 
for (i in (n_de - n_de_age + 1):n_de) {
  variable_data[, i] <- subjects$age + rnorm(n, ifelse(subjects$group == "Control", 0, 1), 0.3)
}


## test results

library(ggvenn)

### only t-test without p-value correction

ggvenn(list(DE=which(sapply(as.data.frame(variable_data),function(x){t.test(x~subjects$group)$p.value})<0.05),
                  truth_random=truth_random,truth_DE_not_age_affected=truth_DE_not_age_affected,truth_DE_age_affected=truth_DE_age_affected))

### only t-test with p-value correction

ggvenn(list(DE=which(p.adjust(sapply(as.data.frame(variable_data),function(x){t.test(x~subjects$group)$p.value}))<0.05),
            truth_random=truth_random,truth_DE_not_age_affected=truth_DE_not_age_affected,truth_DE_age_affected=truth_DE_age_affected))

### lm adjust with p-value correction

ggvenn(list(DE=which(p.adjust(sapply(as.data.frame(variable_data),function(x){summary(lm(x~subjects$group+subjects$age))$coefficients[2,"Pr(>|t|)"]}))<0.05),
            truth_random=truth_random,truth_DE_not_age_affected=truth_DE_not_age_affected,truth_DE_age_affected=truth_DE_age_affected))


