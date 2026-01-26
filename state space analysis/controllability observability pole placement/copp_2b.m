%L2b: Controllability, observability and Pole placement To Check the controllability and observability of the control system.
A=[0 1 0;0 0 1;-6 -11 -6 ];

B=[0;0;1];C=[4 5 1];

Ob = obsv(A,C)

no=size(A);

if rank(Ob)==min(no)
    display('system is observable')
else
    display('system is not observable')
end

CO = ctrb(A,B)

if rank(CO)==min(no)
    display('system is controllable')
else
    display('system is not controllable')
end

CO1=[B A*B A^2*B];%Manual method to compute the Controllability matrix for 3 state system

rank(CO1) % checks the rank of controllability matrix

OB1=[C; C*A; C*A^2];%Manual method to compute the Observability matrix for 3 state system

rank(OB1) % checks the rank of observability matrix

%Problem 2
%(1) Pole placement by Ackermann's Formula

%Illustrative example 1

A=[0 1 0;0 0 1;-6 -11 -6 ];
B=[0;0;1];

C=[4 5 1]; % Third order system example

eig(A)%poles ofopen loop system ABCD

CO=[B A*B A^2*B];%Controllability matrix

rank(CO);

nc=size(A);

if rank(CO)==nc
    display('system is controllable and pole placement is possible')
else
    display('system is not controllable and pole placement is not possible')
exit
end

P=[-8.4563 0 0; 0 -0.7718+0.5919*i 0; 0 0 -0.7718-0.5919*i ]     % Canonical representation with desired closed loop poles in matrix form

P1=[-8.4563; -0.7718+0.5919*i; -0.7718-0.5919*i]    %Canonical representation with desired closed loop poles in vector form

poly(P)     %desired characteristic polynomial coefficients

Phi=polyvalm(poly(P),A);    %desired characteristic polynomial formed with matrix A;

%A^3+alpha1*A^2+alpha2*A+alpha3

K0=[0 0 1]*(inv(CO))*Phi    %Ackerman's formula

Acl0=A-B*K0

eig(Acl0)   %poles of closed loop system with u=-Kx.
% Verification

Kacker1=acker(A,B,P1)
Acl1=A-B* Kacker1
eig(Acl1)
Kacker2=place(A,B,P1)
Acl2=A-B*Kacker2
eig(Acl2)


%Exercise 1a:
%(2) pole placement by controllable canonical form transformation method 1
%Note: System order considered as 3, for change in dimension of A matrix(systemorder), %appropriate change need to be made in ai's, alphai's,w matrix,j vector, k 
% vector
A=[0 1 0;0 0 1;-6 -11 -6];
B=[0;0;1];
C=[4 5 1];      % Third order system example

eig(A)      %0pen loop poles

no=size(A);

Co=ctrb(A,B);

rank(CO)
if rank(CO)==min(no)
    display('system is controllable and arbitray pole placement can be done')
else
    display('system is not controllable and arbitrary pole placement is not possible')
end


ja=poly(A)      %open loop system characteristic polynomial
a1=ja(2);a2=ja(3);a3=ja(4);     %extraction of characteristic equation polynomial
w=[a2 a1 1;a1 1 0;1 0 0];    %weighing matrix
t=CO*w      %transformation matrix to convert A to controllable canonical form with last row
            %characteristic equation coefficients with negative sign in reverse order


jj=poly(P);%desired characteristic polynomial

alpha1=jj(2);
alpha2=jj(3);
alpha3=jj(4);%extraction of closed loop characteristic polynomial
             %coefficients

k=[alpha3-a3 alpha2-a2 alpha1-a1]*inv(t)        %feedback gain matrix
Acl=A-B*k;

eig(Acl)        %final closed loop poles
%Exercise 1b:
%(3)Pole placement by controllable canonical transformation method 2

A=[0 1 0;0 0 1;-6 -11 -6];

B=[0;0;1];
C=[4 5 1];       % Third order system example
eig(A)      %open loop poles

no=size(A);

CO=ctrb(A,B);

rank(CO)

if rank(CO)==min(no)
    display('system is controllable and arbitray pole placement can be done')
else
    display('system is not controllable and arbitrary pole placement is not possible')
end


ja=poly(A)      %open loop system characteristic polynomial

a1=ja(2);a2=ja(3);a3=ja(4);     %extraction of characteristic equation polynomial

invcon=inv(CO)

p1=invcon(3,:)      %Last row of inverse of controllability matrix extracted

V=[p1;p1*A;p1*A*A]  % Transformation matrix to transform A to controllable canonical form

AC=V*A*inv(V)       %controllable canonical form transformation of A

BC=V*B;

alpha=AC(3,:)       %Extraction of last row of Controllable canonical form of A

P=[-1+i*2 -1-i*2 -6]%Desired closed loop poles vector

lamba=poly(P)       %Desired characteristic polynomial coefficients

lambda=lamba(1,2:4) %extraction of coefficients except first one.
K1=[alpha(1)+lambda(3) alpha(2)+lambda(2) alpha(3)+lambda(1)]    %SFB gain matrix of A in CCF
%If A itself is controllable comment following line

K=K1*V          %SFB gain matrix for A
eig(A-B*K)
eig(AC-BC*K1)

%Alternate method by using Ackerman formula
Kacker=[0 0 1]*inv(Co)*[A*A*A+lambda(1)*A*A+lambda(2)*A+lambda(3)*eye(3)]
%Alternate method using Acker command
Kacker1=acker(A,B,P)
