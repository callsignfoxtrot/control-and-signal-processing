% Given impulse response
h = [-4, 1, -1, -2, 5, 6, 6, 5, -2, -1, 1, -4];

% Compute amplitude response and coefficients
[Hr, w, a, L] = hrtype1(h);

% Determine axis limits for stem plots
amax = max(a) + 1;
amin = min(a) - 1;

% Plotting
figure;

% Impulse response h(n)
subplot(2,2,1);
stem(0:length(h)-1, h, 'filled');
axis([-1 length(h) amin amax]);
xlabel('n'); ylabel('h(n)');
title('Impulse Response h(n)');

% Symmetric coefficients a(n)
subplot(2,2,3);
stem(0:L, a, 'filled');
axis([-1 L+1 amin amax]);
xlabel('n'); ylabel('a(n)');
title('Symmetric coefficients a(n)');

% Type-1 amplitude response Hr(w)
subplot(2,2,2);
plot(w/pi, Hr, 'LineWidth', 1.2);
grid on;
xlabel('Frequency (\times\pi rad/sample)'); ylabel('Hr(w)');
title('Type-1 Amplitude Response');

% Zeros of H(z)
subplot(2,2,4);
zplane(h,1);
title('Zeros of H(z)');
