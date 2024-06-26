<!-- # (PART) Mathematical foundations {-} -->

# Mathematical notations

**Aims**

- to recapitulate the basic notations and conventions used in mathematics and statistics

**Learning outcomes**

- to recognize natural numbers, integers and real numbers
- to understand the differences between variables and constants
- to use symbols, especially Sigma and product notations, to represent mathematical operations

## Numbers
- **Natural numbers, N**: numbers such as 0, 1, 3, ...
- **Integers, Z**: include negative numbers ..., -2, -1, 0, 1, 2
- **Rational numbers**: numbers that can be expressed as a ratio two integers, i.e. in a form $\frac{a}{b}$, where $a$ and $b$ are integers, and $b\neq0$
- **Real numbers, R**: include both rational and irrational numbers
- **Reciprocal** of any number is found by diving 1 by the number, e.g. reciprocal of 5 is $\frac{1}{5}$
- **Absolute value** of a number can be viewed as its distance from zero, e.g. the absolute value of 6 is 6, written as $|6| = 6$ and absolute value of -5 is 5, written as $|-5| = 5$
- **Factorial** of a non-negative integer number $n$ is denoted by $n!$ and it is a product of all positive integers less than or equal to $n$, e.g. $4! = 4 \cdot 3\cdot 2 \cdot 1 = 24$

## Variables, constants and letters
Mathematics gives us a precise language to communicate different concepts and ideas. To be able to use it it is essential to learn symbols and understand how they are used to represent physical quantities as well as understand the rules and conventions that have been developed to manipulate them.

- **variables**: things that can vary, e.g. temperature and time
- **constants**: fixed and unchanging quantities used in certain calculations, e.g. 3.14159
- in principle one could freely choose letters and symbols to represent variables and constants, but it is helpful and choose letters and symbols that have meaning in a particular context. Hence, we
- $x, y, z$, the end of the alphabet is reserved for variables
- $a, b, c$, the beginning of the alphabet is used to represent constants
- $\pi$, $\omega$ and Greek letters below are used frequently used to represent common constant, e.g. $\pi = 3.14159$

| Letter | Upper case | Lower case | Letter | Upper case | Lower case |
| :----------- | :----------- | :-------  | :----------- | :----------- | :-------  |
| Alpha | A | $\alpha$ | Nu | N | $\nu$ |
| Beta | B | $\beta$ | Xi | $\Xi$ | $\xi$ |
| Gamma | $\Gamma$ | $\gamma$ | Omicron | O | o |
| Delta | $\Delta$ | $\delta$ | Pi | $\Pi$ | $\pi$ |
| Epsilon | E | $\epsilon$ | Rho | P | $\rho$ |
| Zeta | Z | $\zeta$ | Sigma | $\Sigma$ | $\sigma$ |
| Eta | H | $\eta$ | Tau | T | $\tau$ |
| Theta | $\Theta$ | $\theta$ | Upsilon | Y | $\upsilon$ |
| Iota | I  | $\iota$ | Phi | $\Phi$ | $\phi$ |
| Kappa | K | $\kappa$| Chi | X | $\chi$ |
| Lambda | $\Lambda$ | $\lambda$ | Psi | $\Psi$ | $\psi$ |
| Mu | M | $\mu$ | Omega | $\Omega$ | $\omega$ |
Table: (\#tab:greek-table) Uppercase and lowercase letters of the Greek alphabet

## A precise language
- Mathematics is a precise language meaning that a special attention has to be paid to the exact position of any symbol in relation to other.
- Given two symbols $x$ and $y$, $xy$ and $x^y$ and $x_y$ can mean different things
- $xy$ stands for multiplication, $x^y$ for superscript and $x_y$ for subscript

## Using symbols
If the letters $x$ and $y$ represent two numbers, then:

- their **sum** is written as $x + y$
- subtracting $y$ from $x$ is $x - y$, known also as **difference**
- to multiply $x$ and $y$ we written as $x \cdot y$ or also with the multiplication signed omitted as $xy$. The quantity is known as **product of x and y**
- multiplication is **associative**, e.g. when we multiply three numbers together, $x \cdot y \cdot z$, the order of multiplication does not matter, so $x \cdot y \cdot z$ is the same as $z \cdot x \cdot y$ or $y \cdot z \cdot x$
- division is denoted by $\frac{x}{y}$ and means that $x$ is divided by $y$. In this expression $x$, on the top, is called **numerator** and $y$, on the bottom, is called **denominator**
- division by 1 leaves any number unchanged, e.g. $\frac{x}{1}=x$ and division by 0 is not allowed

<br />

Equal sign

- the equal sign $=$ is used in **equations**, e.g. $x - 5  = 0$ or $5x = 1$
- the equal sign $=$ can be also used in **formulae**. Physical quantities are related through a formula in many fields, e.g. the formula $A=\pi r^2$ relates circle area $A$ to its radius $r$ and the formula $s = \frac{d}{t}$ defines speed as distance $d$ divided by time $t$
- the equal sign $=$ is also used in identities, expressions true for all values of the variable, e.g. $(x-1)(x-1) = (x^2-1)$
- opposite to the equal sign is "is not equal to" sign $\neq$, e.g. we can write $1+2 \neq 4$

<br />

**Sigma and Product notation**

- the $\Sigma$ notation, read as **Sigma notation**, provides a convenient way of writing long sums, e.g. the sum of $x_1 + x_2 + x_3 + ... + x_{20}$ is written as $\displaystyle \sum_{i=1}^{i=20}x_i$
- the $\Pi$ notation, read as **Product notation**, provides a convenient way of writing long products, e.g.  $x_1 \cdot x_2 \cdot x_3 \cdot ... \cdot x_{20}$ is written as $\displaystyle \prod_{i=1}^{i=20}x_i$

## Inequalities
Given any two real numbers $a$ and $b$ there are three mutually exclusive possibilities:

- $a > b$, meaning that $a$ is greater than $b$
- $a < b$, meaning that $a$ is less than $b$
- $a = b$, meaning that $a$ is equal to $b$

<br />

Strict and weak

- inequality in $a > b$ and $a < b$ is **strict**
- as oppose to **weak** inequality denoted as $a \ge b$ or $a \le b$

<br />
Some useful relations are:

- if $a > b$ and $b > c$ then $a > c$
- if $a > b$ then $a + c > b$ for any positive $c$
- if $a > b$ then $ac > bc$ for any positive $c$
- if $a > b$ then $ac < bc$ for any negative $c$

## Indices and powers
- **Indices**, also known as **powers** are convenient when we multiply a number by itself several times
- e.g. $5 \cdot 5 \cdot 5$ is written as $5^3$ and $4 \cdot 4 \cdot 4 \cdot 4 \cdot 4$ is written as $4^5$
- in the expression $x^y$, $x$ is called the *base* and $y$ is called *index* or *power*

The laws of indices state:

- $a^m \cdot a^n = a^{m+n}$
- $\frac{a^m}{a^n} = a^{m-n}$
- $(a^m)^n = a^{m\cdot n}$

Rules derived from the laws of indices:

- $a^0 = 1$
- $a^1 = a$

Negative and fractional indices:

- $a^{-m} = \frac{1}{a^m}$ e.g. $5^{-2} = \frac{1}{5^2} = \frac{1}{25}$ for negative indices
- e.g. $4^{\frac{1}{2}} = \sqrt{4}$ or $8^{\frac{1}{3}} = \sqrt[3]{8}$ for fractional indices

--------

## Exercises: notations

\BeginKnitrBlock{exercise}
<span class="exercise" id="exr:m-notations-numbers"><strong>(\#exr:m-notations-numbers) </strong></span>
Classify numbers as natural, integers or real. If reall, specify if they are rational or irrational.

a) $\frac{1}{3}$
b) 2
c) $\sqrt{4}$
d) 2.3
e) $\pi$
f) $\sqrt{5}$
g) -7
h) 0
i) 0.25

\EndKnitrBlock{exercise}


\BeginKnitrBlock{exercise}
<span class="exercise" id="exr:m-notations-variables-constants"><strong>(\#exr:m-notations-variables-constants) </strong></span>Classify below descriptors as variables or constants. Do you know the letters or symbols commonly used to represent these?

a) speed of light in vacuum
b) mass of an apple
c) volume of an apple
d) concentration of vitamin C in an apple
e) distance from Stockholm central station to Uppsala central station
f) time on the train to travel between the above stations
g) electron charge

\EndKnitrBlock{exercise}


\BeginKnitrBlock{exercise}
<span class="exercise" id="exr:m-notations-sigma-product"><strong>(\#exr:m-notations-sigma-product) </strong></span>Write out explicitly what is meant by the following:

a) $\displaystyle \sum_{i=1}^{i=6}k_i$

b) $\displaystyle \prod_{i=1}^{i=6}k_i$

c) $\displaystyle \sum_{i=1}^{i=6}i^k$

d) $\displaystyle \prod_{i=1}^{i=3}i^k$

e) $\displaystyle \sum_{i=1}^{n}i$

f) $\displaystyle \sum_{i=1}^{i=4}(i + 1)^k$

g) $\displaystyle \prod_{i=1}^{i=4}(k + 1)^i$

h) $\displaystyle \prod_{i=0}^{n}i$

\EndKnitrBlock{exercise}

\BeginKnitrBlock{exercise}
<span class="exercise" id="exr:m-notations-sigma-product-reverse"><strong>(\#exr:m-notations-sigma-product-reverse) </strong></span>
Use Sigma or Product notation to represent the long sums and products below:
  
a) $1+2+3+4+5+6$
b) $2^2+3^2+4^2+5^2$
c) $4 \cdot 5 \cdot 6 \cdot 7 \cdot 8$
d) $1 + \frac{1}{2} + \frac{1}{3} + \frac{1}{4} + \frac{1}{5} +...+ \frac{1}{n}$
e) $2-2^2+2^3-2^4 + ...+2^n$
f) $3+6+9+12+···+60$
g) $3x + 6x^2 + 9x^3 + 12x^4 +...+60x^{20}$
h) $3x \cdot 6x^2 \cdot 9x^3 \cdot 12x^4 \cdot...\cdot 60x^{20}$

\EndKnitrBlock{exercise}


## Answers to selected exercises (notations) {-}

Exr. \@ref(exr:m-notations-numbers)

a) real, rational
b) natural and integers, integers include natural numbers
c) $\sqrt{4} = 2$ so it is a natural number and/subset of integers
d) real number, rational as it could be written as $\frac{23}{10}$
e) real number, irrational as it cannot be explained by a simple fraction
f) real number, irrational as it cannot be explained by a simple fraction
g) integer, non a natural number as these do not include negative numbers
h) natural number, although there is some argument about it as some define natural numbers as positive integers starting from 1, 2 etc. while others include 0.
i) real, rational number, could be written as $\frac{25}{100}$


Exr. \@ref(exr:m-notations-variables-constants)

a) constant, speed of light in vacuum is a constant, denoted $c$ with $c=299 792 458 \frac{m}{s}$
b) variable, mass of an apple is a variable, different for different apple sizes, for instance 138 grams, denoted as $m = 100 g$
c) variable, like mass volume can be different from apple to apple, denoted as $V$, e.g. $V = 200 cm^3$
d) variable, like volume and mass can vary, denoted as $\rho_i$ and defined as $\rho_i=\frac{m}{V}$. So given 6.3 milligrams of vitamin C in our example apple, we have $\rho_i=\frac{0.0063}{2}\frac{g}{cm^3} = 0.0000315 \frac{g}{cm^3}$ concentration of vitamin D
e) constant, the distance between Stockholm and Uppsala is fixed; it could be a variable though if we were to consider an experiment on a very long time scale; distance is often denoted in physics as $d$
f) variable, time on the train to travel between the stations varies, often denoted as $t$ with speed being calculated as $s = \frac{d}{t}$
g) constant, electron charge is $e = 1.60217663\cdot10^{-19} C$


Exr. \@ref(exr:m-notations-sigma-product)

a) $\displaystyle \sum_{i=1}^{i=6}k_i = k_1 + k_2 + k_3 + k_4 + k_5 + k_6$

b) $\displaystyle \prod_{i=1}^{i=6}k_i = k_1 \cdot k_2 \cdot k_3 \cdot k_4 \cdot k_5 \cdot k_6$

c) $\displaystyle \sum_{i=1}^{i=3}i^k = 1^k + 2^k + 3^k$

d) $\displaystyle \prod_{i=1}^{i=3}i^k = 1^k \cdot 2^k \cdot 3^k$

e) $\displaystyle \sum_{i=1}^{n}i = 1 + 2 + 3 + ... + n$ we are using dots (...) to represent all the number until $n$. Here, thanks to Gauss we can also write $\displaystyle \sum_{i=1}^{n}i = \frac{n(n+1)}{2}$, i.e. Gauss formula for sum of first $n$ natural numbers

<!-- f) $\sum_{i=1}^{i=4}(i + 1)^k = (1+1)^k + (2+1)^k + (3+1)^k + (4+1)^k$ -->

<!-- g) $\prod_{i=1}^{i=4}(k + 1)^i = (k+1)^1 \cdot (k+2)^k \cdot (k+3)^k \cdot (k+4)^k$ -->

<!-- h) $\prod_{i=0}^{n}i = 0 \cdot 1 \cdot 2 \cdot ... \cdot n$ which is actually $\prod_{i=0}^{n}i = 0$ as anything multiplied by 0 is 0 -->


Exr. \@ref(exr:m-notations-sigma-product-reverse)

a) $1+2+3+4+5+6 = \displaystyle \sum_{k=1}^{6}k$

b) $2^2+3^2+4^2+5^2 = \displaystyle \sum_{x=2}^{5}x^2$

c) $4 \cdot 5 \cdot 6 \cdot 7 \cdot 8 = \displaystyle \prod_{x=4}^{8}x$

d) $1 + \frac{1}{2} + \frac{1}{3} + \frac{1}{4} + \frac{1}{5} + ... + \frac{1}{n} = \displaystyle \sum_{k=1}^{n}\frac{1}{k}$

<!-- e) $2-2^2+2^3−2^4+...+2^n = \sum_{n=1}^{n} (-1)^n \cdot 2^n$ -->

<!-- f) $3+6+9+12+···+60 = \sum_{n=1}^{30}3\cdot n$ -->

<!-- g) $3x + 6x^2 + 9x^3 + 12x^4 +...+60^{20} = \sum_{n=1}^{20}3 \cdot n \cdot x^n$ -->

<!-- h) $3x \cdot 6x^2 \cdot 9x^3 \cdot 12x^4 \cdot...\cdot60^{20} = \prod_{n=1}^{20}3 \cdot n \cdot x^n$ -->
