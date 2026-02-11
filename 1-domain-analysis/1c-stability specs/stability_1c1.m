
%stability 


% Problem 1:
% Determine the stability of a negative unity feedback system whose open loop
% transfer function is given by
%
%            1.25
%   G(s) = ---------
%          s(s+1)(0.5s+1)
%
% Use the characteristic equation and Routh–Hurwitz stability criterion
% to comment on the stability of the closed loop system.



a = [1.25] ; b = [[1, 1, 0]] ; c = [0.5 1] ;
d=conv(b,c)
figure(1); bode(a,d)
grid on;
margin(a,d)
figure(2); nyquist(a,d)
grid on;
figure(3); rlocus(a,d)
grid on;