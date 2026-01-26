
clc; clear;

A = [0 1 0; 0 0 1; -6 -11 -6];
B = [0; 0; 2];
C = [1 0 0];
D = 0;


L=eig(A)
P=[1 1 1;L(1) L(2) L(3);L(1)^2 L(2)^2 L(3)^2];  %Van der monde transformation matrix for
%transformation of A in controllable canonical form, to diagonal form for distinct root case
PI=inv(P);

ASTILDA=PI*A*P
BSTILDA=PI*B
CSTILDA=C*P
DSTILDA=D

L1=eig(ASTILDA)

DETA=det(A)

detstilda=det(ASTILDA)

TRA=trace(A)

TRASTLIDA=trace(ASTILDA)

[num den]=ss2tf(A,B,C,D)
S1=tf(num, den)

[num1 den1]=ss2tf(ASTILDA,BSTILDA,CSTILDA,DSTILDA)
S2=tf(num1, den1)