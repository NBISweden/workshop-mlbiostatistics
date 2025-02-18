# Matrices

**Aims**

- to introduce matrix and basic matrices operations

**Learning outcomes**

- to be able to write matrices using matrix notations
- to be able to perform simple matrix operations such as adding and multiplication
- to be able to find the reverse of the 2-dimensional matrix

## Matrix
A matrix is a rectangular array of numbers e.g. 

$$\mathbf{A}=\begin{bmatrix}
  x_{11} & x_{12} & x_{13} & \dots & x_{1n} \\
  x_{21} & x_{22} & x_{23} & \dots & x_{2n} \\
  \dots & \dots & \dots& \dots & \dots\\
  x_{m1} & x_{m2} & x_{1m3} & \dots & x_{mn} \\
\end{bmatrix}$$

where:

- the notional subscripts in the typical element $x_{ij}$ refers to its row and column location in the array, e.g. $x_{12}$ refers to element in the first row and second column
- we say that matrix has $m$ rows and $n$ columns and the **dimension** of a matrix is defined as $m \times n$
- a matrix can be viewed as a set of column vectors or a set of row vectors
- a vector can be viewed as a matrix with only one column or with only one row

## Special matrices
- A matrix with the same number of rows as columns, $m = n$, is said to be a **square matrix**
- A matrix that is not squared, $m \neq n$ is called **rectangular matrix**
- A **null matrix** is composed of all 0
- An **identity matrix**, denoted as $\mathbf{I}$ or $\mathbf{I_n}$, is a square matrix with 1's on the main diagonal and all other elements equal to 0, e.g. a three-dimensional identity matrix is $$\mathbf{I}=\begin{bmatrix}
  1 & 0 & 0  \\
  0 & 1 & 0  \\
  0 & 0 & 1
\end{bmatrix}$$
- A square matrix is said to be **symmetric** if $x_{ij} = x_{ji}$ e.g. 
$$\mathbf{A}=\begin{bmatrix}
  1 & 4 & 2  \\
  4 & 1 & 0  \\
  2 & 0 & 1
\end{bmatrix}$$
- A **diagonal matrix** is a square matrix whose non-diagonal entries are all zero, that is $x_{ij} = 0$ for $i \neq j$, e.g. 
$$\mathbf{A}=\begin{bmatrix}
  1 & 0 & 0  \\
  0 & 2 & 0  \\
  0 & 0 & 3
\end{bmatrix}$$
- An **upper-triangular matrix** is a square matrix in which all entries below the diagonal are 0, that is $x_{ij}=0$ for $i<j$ e.g. 
$$\mathbf{A}=\begin{bmatrix}
  1 & 3 & 4  \\
  0 & 2 & 5  \\
  0 & 0 & 3
\end{bmatrix}$$
- A **lower-triangular matrix** is a square matrix in which all entries above the diagonal are 0, that is hat is $x_{ij}=0$ for $i>j$ e.g. 
$$\mathbf{A}=\begin{bmatrix}
  1 & 0 & 0  \\
  1 & 1 & 0  \\
  1 & 1 & 1
\end{bmatrix}$$

## Matrix operations
- matrix $\mathbf{A} = \mathbf{B}$ if both matrices have exactly the same dimension and if each element of $\mathbf{A}$ equals to the corresponding element of e.g. $\mathbf{A} = \mathbf{B}$ if
$\mathbf{A}=\begin{bmatrix}
  1 & 3 & 4  \\
  0 & 2 & 5  \\
  0 & 0 & 3
\end{bmatrix}$ and $\mathbf{B}=\begin{bmatrix}
  1 & 3 & 4  \\
  0 & 2 & 5  \\
  0 & 0 & 3
\end{bmatrix}$

<br />

- for any matrix $\mathbf{A}$ the **transpose**, denoted by $\mathbf{A}^\top$ or $\mathbf{A}^\prime$, is obtained by interchanging rows and columns, e.g. given matrix $\mathbf{A}=\begin{bmatrix}
  1 & 3 & 4  \\
  0 & 2 & 5  \\
  0 & 0 & 3
\end{bmatrix}$ we have $\mathbf{A}^\top=\begin{bmatrix}
  1 & 0 & 0  \\
  3 & 2 & 0  \\
  4 & 5 & 3
\end{bmatrix}$. The transpose of a transpose of a matrix yield the original matrix, $\Big(\mathbf{A}^\top\Big)^\top = \mathbf{A}$

<br />

- we can **add** two matrices if they have the same dimension, e.g. 
$$\mathbf{A} + \mathbf{B} = \mathbf{A} =\begin{bmatrix}
  x_{11} & x_{12}   \\
  x_{21} & x_{22} 
\end{bmatrix} + \begin{bmatrix}
  y_{11} & y_{12}   \\
  y_{21} & y_{22} 
\end{bmatrix} = \begin{bmatrix}
  x_{11}+y_{11} & x_{12}+y_{12}   \\
  x_{21}+y_{21} & x_{22}+y_{22} 
\end{bmatrix}$$

<br />

- we can **multiply** a matrix by **a scalar** $\delta$ e.g. $$\delta \cdot \mathbf{A} = \begin{bmatrix}
  \delta \cdot x_{11} & \delta \cdot x_{12}   \\
  \delta \cdot x_{21} & \delta \cdot x_{22} 
\end{bmatrix}$$

<br />

- we can **multiply two matrices** if they are **conformable**, i.e. first matrix has the same number of columns as the number of rows in the second matrix. We then can write: 
$$\mathbf{C} = \mathbf{A} \cdot \mathbf{B}  = \begin{bmatrix}
  x_{11} & x_{12} & x_{13}  \\
  x_{21} & x_{22} & x_{23}
\end{bmatrix} \times \begin{bmatrix}
  y_{11} & y_{12}   \\
  y_{21} & y_{22}  \\
  y_{31} & y_{32}
\end{bmatrix} = \\\ 
\begin{bmatrix}
  x_{11} \cdot y_{11} + x_{12} \cdot y_{21} + x_{13} \cdot y_{31}  & x_{11} \cdot y_{12} + x_{12} \cdot y_{22} + x_{13} \cdot y_{32}  \\
  x_{21} \cdot y_{11} + x_{22} \cdot y_{21} + x_{23} \cdot y_{31} & x_{21} \cdot y_{12} + x_{22} \cdot y_{22} + x_{23} \cdot y_{32}
\end{bmatrix}$$

## Inverse of a matrix 
For a square matrix $\mathbf{A}$ there may exist a matrix $\mathbf{B}$ such that $\mathbf{A} \cdot \mathbf{B} = \mathbf{I}$. An **inverse**, if it exists, is denoted as $\mathbf{A}^{-1}$ and we can rewrite the definition as $$\mathbf{A} \cdot \mathbf{A}^{-1} = \mathbf{I}$$ where $\mathbf{I}$ is an identify matrix (equivalent to 1). There is no division for matrices, instead we can use inverse to multiply the matrix by an inverse, similar to when instead of dividing the number $a$ by $b$ we multiply $a$ by reciprocal of $b = \frac{1}{b}$

For a 2-dimensional matrix we can follow the below formula for obtaining the inverse 
$$\begin{bmatrix}
  x_{11} & x_{12}   \\
  x_{21} & x_{22} 
\end{bmatrix}^{-1} = \frac{1}{x_{11} \cdot x_{22} - x_{12} \cdot x_{21}} \cdot \begin{bmatrix}
  x_{22} & -x_{12}   \\
  -x_{21} & x_{11} 
\end{bmatrix}$$

<br />

## Orthogonal matrix
- A matrix $\mathbf{A}$ for which $\mathbf{A^\top} = \mathbf{A^{-1}}$ is true is said to be **orthogonal**

-----


## Exercises: matrices

\BeginKnitrBlock{exercise}
<span class="exercise" id="exr:m-matrix"><strong>(\#exr:m-matrix) </strong></span>
Given matrices 

 $\mathbf{A} = \begin{bmatrix}
  1 & 2   \\
  3 & 4
  \end{bmatrix}$, 
  $\mathbf{B} = \begin{bmatrix}
  1 & 0   \\
  0 & 1
  \end{bmatrix}$ and $\mathbf{C} = \begin{bmatrix}
  1 & 0   \\
  0 & 2
  \end{bmatrix}$


a) what is the dimension of matrix $\mathbf{A}$?
b) what is $\mathbf{A}^\top$?
c) which of the matrices is i) an identity matrix ii) a square matrix, iii) null matrix, iv) diagonal matrix, v) a triangular matrix,? 
d) calculate $\mathbf{A} + \mathbf{B}$?
e) calculate $\mathbf{A} \cdot \mathbf{C}$?
f) calculate $\mathbf{B}^\top$
g) calculate $\mathbf{A}^{-1}$
h) calculate $(\mathbf{A} + \mathbf{B})^{-1}$
i) answer again a) - h) this time using R functions and/or commands


\EndKnitrBlock{exercise}

## Answers to selected exercises (matrices) {-}

Exr. \@ref(exr:m-matrix)

a) $2 \times 2$
b) $\mathbf{A}^\top = \begin{bmatrix}
  1 & 3   \\
  2 & 4
  \end{bmatrix}$
c) i) identity matrix: $\mathbf{B}$, ii) a square matrix: $\mathbf{A}$, $\mathbf{B}$ and $\mathbf{C}$, iii) null matrix: none, iv) diagonal matrix: $\mathbf{B}$ (identity matrix is diagonal) and $\mathbf{C}$, v) triangular  $\mathbf{B}$ and  $\mathbf{C}$ as both identify matrix $\mathbf{B}$ and diagonal matrix $\mathbf{C}$ is triangular, both lower and upper triangular
d) $\mathbf{A} + \mathbf{B} = \begin{bmatrix}
  1 & 2   \\
  3 & 4
  \end{bmatrix} + \begin{bmatrix}
  1 & 0   \\
  0 & 1
  \end{bmatrix} = \begin{bmatrix}
  2 & 2   \\
  3 & 5
  \end{bmatrix}$
e) $\mathbf{A} \cdot \mathbf{C} = \begin{bmatrix}
  1 \cdot 1 + 2 \cdot 0 & 1 \cdot 0 + 2 \cdot 2   \\
  3 \cdot 1 + 4 \cdot 0 & 3 \cdot 0 + 4 \cdot 2
  \end{bmatrix} = \begin{bmatrix}
  1 & 4   \\
  3 & 8
  \end{bmatrix}$
f) $\mathbf{B}^\top = \begin{bmatrix}
  1 & 0   \\
  0 & 1
  \end{bmatrix}$
  
g) 

$$\mathbf{A}^{-1} = \begin{bmatrix}
  1 & 2   \\
  3 & 4 
\end{bmatrix}^{-1} = \frac{1}{1 \cdot 4 - 2 \cdot 3} \cdot \begin{bmatrix}
  4 & -2   \\
  -3 & 1
\end{bmatrix} = -\frac{1}{2} \cdot \begin{bmatrix}
  4 & -2   \\
  -3 & 1
\end{bmatrix} = \begin{bmatrix}
  -2 & 1   \\
  \frac{3}{2} & -\frac{1}{2}
\end{bmatrix}$$

<!-- h) calculate $(\mathbf{A} + \mathbf{B})^{-1}$ -->





