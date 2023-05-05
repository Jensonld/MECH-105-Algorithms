## False Position Root Finding Function
#### falsePosition using the false position root finding method to find a root given a function, initial bracketing guesses, and a stopping criterion.
#### Inputs:
* func - the function being evaluated
* xl - the lower guess
* xu - the upper guess
* es - the desired relative error (stopping criterion), if left out defaults to es = 0.0001 (0.01% error)
* maxit - the maximum number of iterations to use, if left out defaults to maxit = 200 (200 iterations)
#### Outputs:
* root - the estimated root location
* fx - the function evaluated at the root location
* ea - the approximate relative error (%)
* iter - how many iterations were performed
#### Function Structure:
[root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
