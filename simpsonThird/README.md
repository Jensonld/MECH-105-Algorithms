## Simpson's 1/3 Rule Integration Function
#### simpsonThird uses Simpson's 1/3 rule to estimate the integral of experimental data given an equally spaced array of independent variables and an array of each of their function values. The spacing between points must be equal. If there is an odd number of intervals from the data, the last interval's integral will be evaluated using the trapezoidal rule.
#### Inputs:
* x - the vector of equally spaced independent variable
* y = the vector of function values with respect to x
#### Outputs:
* I = the numerical integral calculated
#### Function Structure:
[I] = simpsonThird(x, y)
