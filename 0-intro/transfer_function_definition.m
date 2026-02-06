%Transfer Function Definition

%{
Problem 1:
Consider a plant with transfer function
       G(s) = (s^3 + 5*s^2 + 4*s + 6) / (4*s^3 + 7*s^2 + 12*s + 9)
Define this transfer function in MATLAB using two different methods.
%}


%To enter a transfer function
num=[1 5 4 6];
den=[4 5 12 9];
G1=tf(num,den)


%Alternate method
s=tf('s');
G2=(s^3+5*s^2+4*s+6)/( 4*s^3+7*s^2+12*s+9)


%Transfer function to pole-zero conversion, and reverse
%z=num roots, p=den roots 
%k-ratio of coefficient of highest powered term of s in num and den 
%that is gain of TF with normalized num and den polynomial.
[z,p,k]=tf2zp(num,den) 


%To draw the pole zero plot
pzmap(num,den)


%zp2tf to zero pole to transfer function
[num1,denl]=zp2tf(z,p,k)


%To find the partial fraction expansion of the transfer function
%r=residue that is constant multiplier for each factor with roots
%k=gain of transfer function with normalization of num and den polynomial
[r,p,k]=residue(num,den)



%r,p,k to transfer function
[num2,den2]=residue(r,p,k)


%Representation of Transfer function of 2 o/p 1 i/p system)(2X1 matrix)
% specifies the two-output, one-input transfer function
G11G21= tf( {1 ; [1 2 3]} , {[1 2] ; [1 3 6 11 0]}) 

