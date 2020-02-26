## Exercise 1: For x = 2 and y = 8, compute the sum, difference, product and quotient of x and y

x = 2
y = 8

a = x+y  #sets var a to the sum
b = x-y  #sets var b to the difference
d = x*y  #sets var d to the product
e = x/y  #sets var e to the quotient

a  #prints a
b  #prints b
d  #prints d
e  #prints e

## Exercise 2: For x = 3.5 and y = 5, Test x^5 is greater than y^4 and return a logical value

x1 = 3.5
y1 = 5

z = x1^5 > y1^4  #sets var z to logical boolean
z  #prints z

## Exercise 3: Create a vector of the values 211, 62, 108, 43 and 129. Determine the sum of the vector. Divide each value in the vector by the sum to determine relate frequency.

x2 <- c(211,62,108,43,129)  #sets var x2 to vector with num components
y2 = sum(x2)  #sets var y2 to sum of vector
a2 = x2 / y2  #divides each componet of x2 by num y2
a2  #prints a2

## Exercise 4: Create a vector of the nucleotides A, T, C and G. Sort the vector.

x3 <- c("A","T","C","G")  #sets var x3 to vector with char components
y3 = sort(x3)  #sorts x3 by alphabetical order
y3  #prints y3

