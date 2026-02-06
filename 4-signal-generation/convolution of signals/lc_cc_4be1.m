x1 = [1 2 -1 1];
x2 = [1 0 1];


N1 = length(x1);
N2 = length(x2);


% Linear convolution
x3 = conv(x1, x2);


n = 0:1:(N1+N2-2);


subplot(3,1,1);
stem(0:N1-1, x1, 'filled');
xlabel('n'); ylabel('x1(n)'); title('x1(n)'); grid on;


subplot(3,1,2);
stem(0:N2-1, x2, 'filled');
xlabel('n'); ylabel('x2(n)'); title('x2(n)'); grid on;


subplot(3,1,3);
stem(n, x3, 'filled');
xlabel('n'); ylabel('x3(n)'); title('x1(n) * x2(n)'); grid on;