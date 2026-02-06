syms n z real;


% System transfer function coefficients
b = [1];
a = [1 -0.9];


% Pole-zero plot
figure(1);
zplane(b,a);
title('Pole-Zero Plot');


% H(z)
H = 1/(1 - 0.9*z^(-1));
disp('Transfer Function H(z) =');



% Impulse response
h = iztrans(H, z, n);
disp('Impulse response h(n) =');



% Numerical plotting
n1 = 0:20;
hn = double(subs(h, n, n1));


figure(2);
stem(n1, hn, 'filled');
grid on;
xlabel('n');
ylabel('h(n)');
title('Impulse Response');