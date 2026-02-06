clc;
clear all;


n = -10:9;
base = [5 4 3 2 1];
x=base(mod(n,5)+1);
%x = x(1:length(n));
figure;
stem(n,x,'filled');
grid on;
title('Periodic Sequence');
xlabel('n');
ylabel('x(n)');