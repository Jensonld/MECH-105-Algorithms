function [I] = simpsonThird(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x) ~= length(y)
    error('Inputs x and y must have the same length.')
end

% Error checking for equally spaced x values
dx = diff(x);
if any(abs(dx - dx(1)) > eps)
    error('Input x must be equally spaced.')
end

% Warn user if trapezoidal rule must be used on last interval
if mod(length(x), 2) == 0
    warning('Trapezoidal rule will be used for the last interval.')
end

% Simpson's 1/3 rule
n = length(x) - 1; % number of intervals
h = dx(1);
I = y(1) + y(end); % first and last terms
if length(x) ==2
    warning('only two points')
    I = h*((y(1)+y(2))/2)
end
if length(x)>=3
for i = 2:2:n
    I = I + 4*y(i); % even terms
end
for i = 3:2:n-1
    I = I + 2*y(i); % odd terms
end
if mod(length(x), 2) == 0 % trapezoidal rule for last interval
    I = I + y(end-1);
end
I = (h/3) * I;
end
end