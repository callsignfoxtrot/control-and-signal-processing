x1 = [1 2 3];
x2 = [2 1 1];


% Convolution in both orders
y1 = conv(x1, x2);
y2 = conv(x2, x1);


% Display
x1
x2
y1
y2


% Plot
subplot(2,1,1);
stem(0:length(y1)-1, y1, 'filled');
title('x1(n) * x2(n)'); grid on;


subplot(2,1,2);
stem(0:length(y2)-1, y2, 'filled');
title('x2(n) * x1(n)'); grid on;