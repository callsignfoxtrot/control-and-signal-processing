% Parameters
N = 5;

% Sample index for DFS
k = 0:N-1;
wk = 2*pi*k/N;

% z samples
zk = exp(1j*wk);

% DFS samples from X(z)
Xk = zk ./ (zk - 0.7);

% Compute IDFS
xn = real(idfs(Xk, N)); % take real part

% Create periodic extension
xtilde = xn' * ones(1, 8); % 8 periods
xtilde = xtilde(:)';      % flatten to row vector

% Plot
figure;
subplot(2,2,1);
stem(0:39, xtilde, 'filled');
axis([0,40,-0.1,1.5]);
xlabel('n'); ylabel('xtilde(n)');
title('N=5');
