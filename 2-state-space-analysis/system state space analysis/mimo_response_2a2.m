%MIMO response

%{
Problem 2: MIMO System Time Domain Response

Objective:
– Obtain the transfer function of a MIMO system with 2 inputs and 2 outputs
– Analyze system stability using eigenvalues
– Plot step responses
%}

clear all; 

%To Obtain the transfer function of a MIMO (2 o/p, 2 i/p) system 2X2 matrix
A=[0 1;-25 -4]; 
B=[1 1;0 1]; 
C=[1 0;0 1]; 
D=[0 0;0 0];
[num1,den1]=ss2tf(A,B,C,D, 1)
% gives y1(s)/u1(s) and y2(s)/u1(s) with u2 zero
[num2, den2]=ss2tf(A,B,C,D,2)
% gives y1(s)/u2(s) and y2(s)/u2(s) with ul zero

% To find the eigen value
eig(A)  % Roots of denominator polynomial of transfer function. All-ve system stable.


%Step Response curves of a MIMO system.
figure(2)
[y1 y2 t]=step(A,B,C,D,1);
plot(t,y1,t,y2)
grid
title('Step Response plots: Input=u1 (u2=0)')
text(3.4,-0.06,'Y1')
text(3.4,1.4,'Y2')
figure(3)
[y1 y2 t]=step(A,B,C,D,2);
plot(t,y1,t,y2)
grid
title('Step Response plots: Input=u2 (u1=0)')
text(3.0,0.14,'Y1')
text(2.8,1.1,'Y2')

