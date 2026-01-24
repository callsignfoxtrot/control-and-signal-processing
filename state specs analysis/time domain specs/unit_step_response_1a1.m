%Unit step response

%{
Problem 1: Time Domain Specifications and Steady-State Errors (L1a)

Objective:
Obtain the unit step response of the system whose closed-loop transfer function is:

             C(s) = 25
        -----------------
         R(s) = s^2 + 4s + 25

Tasks:
1. Plot the unit step response of the system.
2. Determine the time-domain specifications:
   i) Maximum overshoot
   ii) Peak time
   iii) Rise time
   iv) Delay time
   v) Settling time
3. Verify the results theoretically.
On plot right click mouse and select characteristics option to see time response specifications
%}



%step response of a system
num=[0 0 25]; den=[1 4 25];
figure(1); step(num,den) %plots step response of the system
title('unit step response of G(s)=25/s^2+4s+25)')
xlabel('t sec'); ylabel('output')
grid on;



% Time-domain specifications
info = stepinfo(sys);
disp('Time-Domain Specifications:')
disp(info)