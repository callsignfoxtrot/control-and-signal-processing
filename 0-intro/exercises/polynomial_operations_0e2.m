
%Polynomial Operations


%{
Additional Exercise - Exercise 2:

Consider the two polynomials:
    p(s) = s^2 + 2*s + 1
    q(s) = s + 1

Compute the following using MATLAB:
    i.  p(s) * q(s)
    ii. Poles and zeros of G(s) = q(s)/p(s)
    iii. Evaluate p(-1)
%}


% i. p(s) * q(s)
cp = [1 2 1];     
cq = [1 1];      
pq = conv(p,q)
 


% ii. Poles and zeros of G(s) = q(s)/p(s)
[z,p,k]=tf2zp(cq,cp)


% iii. Evaluate p(-1)
p_eval = polyval(p,-1)