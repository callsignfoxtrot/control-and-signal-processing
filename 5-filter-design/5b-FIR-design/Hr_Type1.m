function [Hr, w, a, L] = Hr_Type1(h)
% Computes Type-1 amplitude response Hr(w) of a symmetric FIR filter
% h : impulse response
% Hr : amplitude response
% w : frequency vector
% a : symmetric coefficients
% L : half-length (M-1)/2

M = length(h);
L = (M - 1) / 2;

% Symmetric coefficients
a = [h(L+1), 2*h(L:-1:1)];  % row vector of length L+1

% Frequency vector
w = (0:500)' * pi / 500;  % column vector

% Cosine series for Type-1 amplitude response
n = 0:L;  % column vector of indices
Hr = cos(w * n) * a';      % Hr(w)
end
