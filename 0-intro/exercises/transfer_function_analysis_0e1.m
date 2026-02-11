%Transfer Function Analysis

%{
Exercise 1:
Consider the transfer functions:
       G(s) = (6*s^2 + 1) / (s^3 + 3*s^2 + 3*s + 1)
       H(s) = (s + 1)*(s + 2) / ((s + 2i)*(s - 2i)*(s + 3))

Perform the following:
   i.  Compute the poles and zeros of G(s)
   ii. Express H(s) as a ratio of two polynomials in s
   iii. Obtain G(s)/H(s) and find its pole-zero plot
%}


% i. Compute the poles and zeros of G(s)
numG = [6 0 1];       
denG = [1 3 3 1];

z = roots(numG)
p = roots(denG)


% ii. Express H(s) as a ratio of two polynomials
n1 = [1 1];  
n2 = [1 2]; 
d1 = [1 2i]; 
d2 = [1 -2i]; 
d3 = [1 3];   

numH = conv(n1, n2);
denH = conv(conv(d1, d2), d3);
H = tf(numH, denH)



% iii. Obtain G(s)/H(s), also find its pole zero plot.
num=conv(numG,denH);
den=conv(denG,numH)
printsys(num, den)
pzmap(num,den)

