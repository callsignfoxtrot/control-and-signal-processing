function [Hr, w, a, L] = hrtype1(h)
% Computes amplitude response Hr(w) of a symmetric FIR filter
% Works for both even and odd-length sequences
% h : impulse response
% Hr : amplitude response
% w : frequency vector
% a : symmetric coefficients
% L : half-length

M = length(h);

% Determine L based on even or odd length
if mod(M,2) == 1
    % Odd-length (Type-1)
    L = (M-1)/2;
    a = [h(L+1), 2*h(L:-1:1)];  % symmetric coefficients
else
    % Even-length (Type-2)
    L = M/2;
    a = [h(L+1), 2*h(L:-1:1)];  % generalized symmetric coefficients
end

% Frequency vector
w = (0:500)' * pi / 500;  % column vector

% Cosine series for amplitude response
n = 0:(length(a)-1);  % row vector of indices
Hr = cos(w * n) * a'; % Hr(w)
end
