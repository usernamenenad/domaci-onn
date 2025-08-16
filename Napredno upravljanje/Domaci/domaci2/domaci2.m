%% Regulator po stanjima
A = [0, 1; -7, -5];
B = [0; 2];
C = [1, 0];
D = 0;

n = rank(ctrb(A, B));
K = acker(A, B, [-3, -3]);
x0 = [-2; 2];

%% Promjenljive stanja (prvo simulirati model2_2020.slx)
t = out.tout;
x1 = out.yout{1}.Values.Data(:, 1);
x2 = out.yout{1}.Values.Data(:, 2);

plot(t, x1, 'LineWidth', 1.5);
hold on;
grid on;
plot(t, x2, 'LineWidth', 1.5);
xlabel('$t$', 'Interpreter', 'Latex');
legend('$x_{1}(t)$', '$x_{2}(t)$',...
       'Interpreter', 'Latex',...
       'FontSize', 12)

%% Računanje kr
s = tf("s");
Ak = A - B * K;
R = 5;

% G = G0 * kp
G0 = C * inv(s * eye(2) - Ak) * B;
kr = 1 / (dcgain(s * G0 / s));