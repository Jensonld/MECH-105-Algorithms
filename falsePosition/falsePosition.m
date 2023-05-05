function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method

if nargin <3
    error('not enough input arguments')
end
if nargin<4
    es=0.0001;
    maxit=200;
end
if nargin<5
    maxit=200;
end

iter=0;
ea=100;
last_root=100;

while ea>es && iter<maxit
    iter=iter+1;
    fxl=func(xl);
    fxu=func(xu);
    root = xu-((fxu*(xl-xu))/(fxl-fxu));
    fx=func(root);
    if fx==0
        ea=0;
    end
    if fx<0 && fxl<0 || fx>0 && fxl>0
        xl=root;
    else
        xu=root;
    end
    if fx~=0
        ea=(abs(root-last_root)/root)*100
    end
    last_root=root;
end
end
