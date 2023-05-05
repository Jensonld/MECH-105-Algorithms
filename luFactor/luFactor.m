function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% Inputs:
%	A = coefficient matrix
% Outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
n = length(A);
if size(A, 1) ~= size(A, 2)
    error('Input matrix is not square');
end

n = size(A, 1);
L = eye(n); 
U = A;
P = eye(n);

for k = 1:n-1
    [max_value, max_index] = max(abs(U(k:n, k)));
    max_index = max_index + k - 1;
    if max_value == 0
        error('Matrix is singular');
    end
    U([k, max_index], k:n) = U([max_index, k], k:n);
    P([k, max_index], :) = P([max_index, k], :);
    if k > 1
        L([k, max_index], 1:k-1) = L([max_index, k], 1:k-1);
    end
    for i = k+1:n
        L(i, k) = U(i, k) / U(k, k);
        U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n);
    end
end


end