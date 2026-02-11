syms z n;


X = 1/(1 - 1.5*z^(-1) + 0.5*z^(-2));


x = iztrans(X, z, n);


disp('Inverse Z-transform x(n) =');
x


% Plot
n1 = 0:20;
xn = double(subs(x, n, n1));


figure;
stem(n1, xn, 'filled');
grid on;
xlabel('n');
ylabel('x(n)');
title('Inverse Z-transform Sequence');