% design1
% Gain adjustment; enter the specifications
OS = 9.5;
numg = [100];
deng = poly([0 -36 -100]);
G = tf(numg, deng);

% TO FIND REQUIRED DAMPING RATIO
z = (-log(OS/100)) / sqrt(pi^2 + log(OS/100)^2)

% To find the required phase margin
pmreq = atan(2*z / (sqrt(-2*z^2 + sqrt(1 + 4*z^4)))) * (180/pi)

% Find the phase margin of the given system
w = logspace(-2,3,1000);
bode(G,w);
grid on;

% Calculation: Determine additional gain needed to produce required phase margin
% From Bode plot, mark frequency where phase = -180 + pmreq
% Determine magnitude at this frequency M (dB)
K = 10^(-M/20);

% Verify the result from closed-loop step response
numgn = K*numg
hold on;
bode(numgn,deng);

T = feedback(K*G,1)
figure();
step(T);
CGC = K*G
