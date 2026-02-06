% design 2
% Root locus method

% Enter the system transfer function
num = [1 1.5];
den = poly([0 -1 -10]);
G = tf(num, den)

% TO OBTAIN THE ROOT LOCUS PLOT
rlocus(G)
title('original root locus plot')
%pause

% Enter the desired % overshoot
OS = 1.52;

% Obtain the damping ratio
z = (-log(OS/100)) / sqrt(pi^2 + log(OS/100)^2)

% To mark desired damping ratio
sgrid(z,0);
title(['root locus plot with ', num2str(OS), '% overshoot line'])

% To obtain gain K and closed-loop poles (zoom figure and click)
[K, P] = rlocfind(G)

% Obtain closed-loop transfer function for the given K
T = feedback(K*G,1)
%pause
step(T);

% Verify the time domain specifications
TS = -4 / real(P(1))
TP = pi / imag(P(1))

s = tf([1 0], [0 1])
KV = dcgain(s*G)
