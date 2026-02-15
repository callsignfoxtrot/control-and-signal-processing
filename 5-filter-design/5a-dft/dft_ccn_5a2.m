N = 4; % declare the value of N

% Input sequences
x1 = [0, 1, 0, 1]; 
x2 = [1, 2, 1, 2];

% Compute 4-point DFTs
disp('The 4-point DFT of x1(n) is:');
X1 = fft(x1, N)

disp('The 4-point DFT of x2(n) is:');
X2 = fft(x2, N)

% Multiply DFTs element-wise
disp('The product of DFTs is:');
X1X2 = X1 .* X2

% Compute circular convolution using IDFT
X3 = ifft(X1X2); 
disp('Circular convolution of x1(n) and x2(n) is:');
X3 = real(X3) % ensure result is real if inputs are real
