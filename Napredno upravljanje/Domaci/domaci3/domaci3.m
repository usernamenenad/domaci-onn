%% Estimator i regulator po izlazima procesa.
A = [-3, 2; 1, -2];
B = [0; 2];
C = [0, 1];
D = 0;
x0 = [2; -2];

p_est = [-10, -10];
p_cl = [-1, -1];
L = acker(A', C', p_est)';

K = acker(A, B, p_cl);

%% Praćenje reference.
Ak = A - B * K;
R = 5;
s = tf("s");
G0 = C * inv(s * eye(2) - Ak) * B;
kr = 1 / dcgain(s * G0 / s);

%% Rezultati simulacije (prvo simulirati model3.slx).
t = out.tout;

x1 = out.x.Data(:, 1);
x2 = out.x.Data(:, 2);

x1_hat = out.x_est.Data(:, 1);
x2_hat = out.x_est.Data(:, 2);

subplot(211);
plot(t, x1, 'LineWidth', 1.5);
hold on;
grid on;
plot(t, x1_hat, 'LineWidth', 1.5);
xlabel('$t$', 'Interpreter', 'Latex');
legend('$x_{1}(t)$', '$\hat{x_{1}}(t)$',...
       'Interpreter', 'Latex',...
       'FontSize', 12);

subplot(212);
plot(t, x2, 'LineWidth', 1.5);
hold on;
grid on;
plot(t, x2_hat, 'LineWidth', 1.5);
xlabel('$t$', 'Interpreter', 'Latex');
legend('$x_{2}(t)$', '$\hat{x_{2}}(t)$',...
       'Interpreter', 'Latex',...
       'FontSize', 12);