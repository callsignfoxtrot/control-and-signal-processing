 t = exp73.time;
y = exp73.tempP;      % P control response
r = 50;               % example setpoint, change this

% steady-state value
yss = y(end);

% peak and peak time
[ypeak, idx_peak] = max(y);
tp = t(idx_peak);

% overshoot
mp = ((ypeak - r) / r) * 100;

% rise time using 10% and 90% of setpoint
y10 = 0.1 * r;
y90 = 0.9 * r;

idx10 = find(y >= y10, 1, 'first');
idx90 = find(y >= y90, 1, 'first');

tr = t(idx90) - t(idx10);

% settling time using ±2% of setpoint
upper = 1.02 * r;
lower = 0.98 * r;

idx_ts = find(y < lower | y > upper, 1, 'last');

if ~isempty(idx_ts) && idx_ts < length(t)
    ts = t(idx_ts + 1);
else
    ts = t(end);
end

% steady-state error
ess = abs(r - yss);

% plot
plot(t, y, 'b', 'LineWidth', 1.5)
hold on
grid on

% mark peak
plot(tp, ypeak, 'ro', 'MarkerSize', 8)
text(tp, ypeak, ['  Tp = ' num2str(tp)])
text(tp, ypeak - 2, ['  Mp = ' num2str(mp, '%.2f') '%'])

% mark rise time points
plot(t(idx10), y(idx10), 'ko', 'MarkerSize', 7)
plot(t(idx90), y(idx90), 'ko', 'MarkerSize', 7)
text(t(idx10), y(idx10), '  10%')
text(t(idx90), y(idx90), '  90%')

% vertical lines
xline(tp, 'r--', 'Tp')
xline(ts, 'm--', 'Ts')

% horizontal lines
yline(r, 'k--', 'Setpoint')
yline(upper, 'g--', '+2% band')
yline(lower, 'g--', '-2% band')

xlabel('Time')
ylabel('Temperature')
title('P Control Response')
legend('P response', 'Peak', '10% point', '90% point')

fprintf('Rise Time Tr = %.2f\n', tr)
fprintf('Peak Time Tp = %.2f\n', tp)
fprintf('Maximum Overshoot Mp = %.2f%%\n', mp)
fprintf('Settling Time Ts = %.2f\n', ts)
fprintf('Steady State Error Ess = %.2f\n', ess)


