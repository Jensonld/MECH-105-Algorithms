function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
if length(y)~=length(x)
    error('different sizes of arrays')
end
[sortedY,sortOrder] = sort(y);
sortedX = x(sortOrder);
n = length(x);
Q1i = floor((n+1)/4); 
Q3i = floor((3*n+3)/4);
Q1 = sortedY(Q1i); 
Q3 = sortedY(Q3i); 
IQR = Q3-Q1;

fY = [];
fX = [];
for i = 1:n
    if sortedY(i) > (Q1-(1.5*IQR)) && sortedY(i) < (Q3+(1.5*IQR))
        fY = [fY sortedY(i)];
        fX = [fX sortedX(i)];
    end
end

n = length(fX);
sumXY = sum(fX.*fY);
sumX = sum(fX);
sumY = sum(fY);
sumXsquare = sum(fX.^2);
meanX = mean(fX);
meanY = mean(fY);

slope = ((n*sumXY-sumX*sumY)/(n*sumXsquare-(sumX.^2)));
intercept = meanY-slope*meanX;

f = @(x) slope*x+intercept
SStot = sum((fY-meanY).^2);
SSres = sum((fY-f(fX)).^2);
Rsquared = 1-(SSres/SStot);
end