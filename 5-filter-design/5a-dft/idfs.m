function [xn] = idfs(Xk, N)
% Computes Inverse Discrete Fourier Series
% Xk : DFS coefficients (row vector)
% N  : Number of points

% n and k indices
n = 0:N-1; % row vector for time indices
k = 0:N-1; % row vector for frequency indices

% WN factor
WN = exp(-1j*2*pi/N);

% Create nk matrix
nk = n' * k; % N x N matrix

% Compute WN to the power -nk
WNnk = WN .^ (-nk);

% IDFS computation
xn = (Xk * WNnk) / N; % row vector of IDFS values
end
