
%Controller Plant Conditions

%{
Problem 2:
(a) Consider a controller 
       G1(s) = (s + 1) / (s + 2) 
and a plant 
       G2(s) = 1 / (500*s^2) 
as two system transfer functions. 

Obtain the overall transfer function of the system when they are connected in:
   a. Cascade
   b. Parallel
   c. Feedback
%}




% a. Cascaded system when both controller and plant are in series in the forward path
numg1=[1 1];
deng1=[1 2]; 
numg2=[1];
deng2=[500 0 0];
[nums,dens]=series(numg1,deng1,numg2,deng2)
printsys(nums,dens)


%Alternatively
s=tf('s');
G1=(s+1)/(s+2);
G2=1/(500*s^2);
GC=G1*G2


%Alternatively
[nums]=conv(numg1,numg2)
[dens]=conv(deng1,deng2)
syss=tf(nums,dens)


% b. Parallel system when plant and controller are in parallel forward paths
[nump,denp]=parallel(numg1,deng1,numg2, deng2)
printsys(nump,denp)


%Alternatively
GP=G1+G2


% c.i. -ve unity feedback systems with G1 and G2 are in series in forward path
[ncl,dcl]=feedback(nums,dens,1,1,-1) 
printsys(ncl,dcl)


%Alternatively
[ncl,dcl]=cloop(nums, dens)
printsys(ncl,dcl)


% c.ii. +ve unity feedback systems with plant and controller are in series in forward path
[nclp,dclp]=feedback(nums,dens, 1,1,+1)
printsys(nclp,dclp)


%Alternatively
[nclp,dclp]=cloop(nums,dens,+1)
printsys(nclp,dclp)


% c.iii. feedback system with G2 in forward path and G1 in feedback path with -ve feedback
[nclgh,dclgh]=feedback(numg2,deng2,numg1,deng1,-1)
printsys(nclgh,dclgh)