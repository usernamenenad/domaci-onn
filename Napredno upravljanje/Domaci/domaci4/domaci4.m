%% Sistem (dvije estimacije).
A = [-3, -2; 1, -2];
B = [0; 2];
C = [0, 1];
D = 0;

%% Generator poremećaja (jedna estimacija).
Aw = 0;
Cw = 1;

%% Estimator čitavog sistema.
p_est = [-10, -10, -10]; % Tri pola estimatora, jer estimiramo 3 vrijednosti.

A_bar = [A, B * Cw; 0, 0, Aw];
C_bar = [C, 0];
L = acker(A_bar', C_bar', p_est)';

Lx = L(1:2);
Lw = L(3);

%% Regulator po stanjima.
p_sys = [-1, -1];
K = acker(A, B, p_sys);

%% Računanje pojačanja kr.
Ak = A - B * K;
R = 5;
s = tf("s");
G0 = C * inv(s * eye(2) - Ak) * B;
kr = 1 / dcgain(s * G0 / s);

%% Rezultati simulacije (prvo simulirati model4.slx).
t = out.tout;

x1 = out.x.Data(:, 1);
x2 = out.x.Data(:, 2);

x1_hat = out.x_hat.Data(:, 1);
x2_hat = out.x_hat.Data(:, 2);

subplot(211);
plot(t, x1, LineWidth=1.5);
hold on;
grid on;
plot(t, x1_hat, LineWidth=1.5);
xlabel('$t$', Interpreter='Latex');
legend('$x_{1}(t)$', '$\hat{x}_{1}(t)$',...
       Interpreter = 'Latex',...
       FontSize = 12);

subplot(212);
plot(t, x2, LineWidth=1.5);
hold on;
grid on;
plot(t, x2_hat, LineWidth=1.5);
xlabel('$t$', Interpreter='Latex');
legend('$x_{2}(t)$', '$\hat{x}_{2}(t)$',...
       Interpreter = 'Latex',...
       FontSize = 12);





