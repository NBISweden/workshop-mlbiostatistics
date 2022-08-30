# Vectors

**Aims**

- to introduce vectors and basic vectors operations

**Learning outcomes**

- to be able to write $n$-dimensional vectors using vector notations
- to be able to perform addition and scalar multiplication
- to be able to check if two vectors are orthogonal


A large number of statistical models use vectors and matrices, both for compact representations, and for the calculations, e.g. parameter estimates. 

## Vectors 

- A vector is an ordered set of number
- These numbers, e.g. in vector $\mathbf{x}$ can be expressed as a row $\mathbf{x}=[6\quad 0\quad 5 \dots1]$
- or as a column $\mathbf{x}=\begin{bmatrix}
  6 \\ 
  0 \\
  5 \\
  \vdots \\
  1
\end{bmatrix}$ 
- the number of elements in a vector is referred to as its **dimension** and we often use $n$ to express $n$-dimensional vector, where $n$ can be any natural number 
- here, we denote vectors using small bold font $\mathbf{x}$, other notations may include an arrow $\vec x$ or overline $\overline{x}$
- also **parentheses** are used interchangeably with **square bracket**, e.g. $\mathbf{x}=[6\quad 0\quad 5 \dots1]$ can be written as $\mathbf{x}=(6\quad 0\quad 5 \dots1)$ or $\begin{pmatrix}
  6\\
  0\\
  5\\
  \vdots \\
  1
\end{pmatrix}$ 

## Operations on vectors
Given two vectors of the same dimension: 
$\mathbf{x}=\begin{bmatrix}
  x_1 \\ 
  x_2 \\
  x_3 \\
  \vdots \\
  x_n
\end{bmatrix}$ 
and 
$\mathbf{y}=\begin{bmatrix}
  y_1 \\ 
  y_2 \\
  y_3 \\
  \vdots \\
  y_n
\end{bmatrix}$ 

**Addition**: we add two vectors, element by element $\mathbf{x} + \mathbf{y}=\begin{bmatrix}
  x_1 + y_1 \\ 
  x_2 + y_2 \\
  x_3 + y_3 \\
  \vdots \\
  x_n + y_n
\end{bmatrix}$ 

**Scalar multiplication**: we can multiple vector by a numerical value, scalar, denoted as $\gamma$: 
$$\gamma \cdot \mathbf{x} =\begin{bmatrix}
  \gamma \cdot x_1 \\ 
  \gamma \cdot x_2 \\
  \gamma \cdot x_3 \\
  \vdots \\
  \gamma \cdot x_n 
\end{bmatrix}$$

**Difference** $\mathbf{x} - \mathbf{y}$ can be written as $\mathbf{x} + (-1) \cdot \mathbf{y}$, thus we multiply second vector with $-1$ and then add two vectors

**Linear combination of vectors**: the vector $\gamma \cdot \mathbf{x} + \delta \cdot \mathbf{y}$ is said to be a linear combination of $\mathbf{x}$ and $\mathbf{y}$: 
$$\gamma \cdot \mathbf{x} + \delta \cdot \mathbf{y} =\begin{bmatrix}
  \gamma \cdot x_1 + \delta \cdot y_1 \\ 
  \gamma \cdot x_2 + \delta \cdot y_2\\
  \gamma \cdot x_3 + \delta \cdot y_3\\
  \vdots \\
  \gamma \cdot x_n + \delta \cdot y_n
\end{bmatrix}$$

**Inner product of vectors** is given by: $$\mathbf{x} \cdot \mathbf{y} = x_1 \cdot y_1 + x_2 \cdot y_2 + \dots x_n \cdot y_n = \displaystyle\sum_{i=1}^{n}x_i\cdot y_i$$

**Orthogonality of vectors**: two vectors are said to be orthogonal if their inner product is zero $$\mathbf{x} \cdot \mathbf{y} =\displaystyle\sum_{i=1}^{n}x_i\cdot y_i = 0$$

## Null and unit vector
- a **null vector**  is a vector whose elements are all $0$; the difference between any vector and itself yields a null vector
- a **unit vector** is a vector whose elements are all $1$

------

## Exercises: vectors

\BeginKnitrBlock{exercise}
<span class="exercise" id="exr:m-vectors"><strong>(\#exr:m-vectors) </strong></span>Based on vector definitions and operations:
  
a) find the vector $\mathbf{x} + \mathbf{y}$ when $\mathbf{x} =\begin{bmatrix}
  1 \\ 
  2 \\
  5
\end{bmatrix}$ and $\mathbf{y} =\begin{bmatrix}
  0\\ 
  3 \\
  1
  \end{bmatrix}$

b) find the vector $2\mathbf{x} - \mathbf{y}$ when $\mathbf{x} =\begin{bmatrix}
  -2 \\ 
  3 \\
  5
\end{bmatrix}$ and $\mathbf{y} =\begin{bmatrix}
  0\\ 
  -4 \\
  7
  \end{bmatrix}$

c) are $\mathbf{u}$ and $\mathbf{v}$ vectors orthogonal when  when $\mathbf{u} =\begin{bmatrix}
  1 \\ 
  2
\end{bmatrix}$ and $\mathbf{v} =\begin{bmatrix}
  2\\ 
  -1
  \end{bmatrix}$?
  
d) are $\mathbf{u}$ and $\mathbf{v}$ vectors orthogonal when  when $\mathbf{u} =\begin{bmatrix}
  3 \\ 
  -1
\end{bmatrix}$ and $\mathbf{v} =\begin{bmatrix}
  7\\ 
  5
  \end{bmatrix}$?
  
e) find the value $n$ such that the vectors $\mathbf{u} =\begin{bmatrix}
  2 \\ 
  4 \\
  1
\end{bmatrix}$ and $\mathbf{v} =\begin{bmatrix}
  n\\ 
  1 \\
  8
  \end{bmatrix}$ are orthogonal. 


\EndKnitrBlock{exercise}

## Answers to selected exercises (vectors and matrices) {-}

Exr. \@ref(exr:m-vectors)


a) 

$$\mathbf{x} + \mathbf{y} = \begin{bmatrix} 1 \\ 2 \\ 5 \end{bmatrix} + \begin{bmatrix} 0 \\ 3 \\ 1 \end{bmatrix} = \begin{bmatrix} 1 + 0\\ 2 + 3 \\ 5 + 1 \end{bmatrix} = \begin{bmatrix} 1 \\ 5 \\ 6 \end{bmatrix}$$



b) $$2\mathbf{x} - \mathbf{y} = \begin{bmatrix} 2 \cdot (-2) \\ 2 \cdot 3 \\ 2 \cdot 5 \end{bmatrix} + \begin{bmatrix} (-1) \cdot 0 \\ (-1) \cdot (-4) \\ (-1) \cdot 7 \end{bmatrix} = \begin{bmatrix} -4 \\ 6 \\ 10 \end{bmatrix}  + \begin{bmatrix} 0 \\ 4 \\ -7 \end{bmatrix}  = \begin{bmatrix} -4 + 0 \\ 6 + 4 \\ 10 - 7 \end{bmatrix} = \begin{bmatrix} -4 \\ 10 \\ 3 \end{bmatrix}$$

c) Yes, to check orthogonality we need to calculate the inner product of two vectors and see if it is equal to 0, here 
$\mathbf{u} \cdot \mathbf{v} =\displaystyle\sum_{i=1}^{2}u_i\cdot v_i = 1 \cdot 2 + 2 \cdot (-1) = 2 - 2 = 0$

d) No, since the inner product does not equal to 0 $$\mathbf{u} \cdot \mathbf{v} =\displaystyle\sum_{i=1}^{2}u_i\cdot v_i = 3 \cdot 7 + (-1) \cdot 5 = 21 - 5 = 16 \neq 0$$
  
