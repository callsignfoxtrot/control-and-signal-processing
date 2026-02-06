n = -10:10;
x = exp((-0.1 + 1j*0.3)*n);


subplot(2,1,1);
stem(n,real(x),'filled');
grid on;
title('Real Part of x(n)');


subplot(2,1,2);
stem(n,imag(x),'filled');
grid on;
title('Imaginary Part of x(n)');-