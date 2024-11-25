Tf = 1;

%%
% p = [-dot_y; -y; u]
t_01 = out.tout;
a1_01 = out.theta_01.Data(1, :);
a0_01 = out.theta_01.Data(2, :);
b0_01 = out.theta_01.Data(3, :);

figure;
hold on;
grid on;
plot(t_01, a1_01, LineWidth = 1.5);
plot(t_01, a0_01, LineWidth = 1.5);
plot(t_01, b0_01, LineWidth = 1.5);
xlabel("$t$", Interpreter = 'Latex', FontSize = 12);
legend('$a_{1}$', '$a_{0}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12)

%%
t_1 = out.tout;
a1_1 = out.theta_1.Data(1, :);
a0_1 = out.theta_1.Data(2, :);
b0_1 = out.theta_1.Data(3, :);

figure;
hold on;
grid on;
plot(t_1, a1_1, LineWidth = 1.5);
plot(t_1, a0_1, LineWidth = 1.5);
plot(t_1, b0_1, LineWidth = 1.5);
xlabel("$t$", Interpreter = 'Latex', FontSize = 12);
legend('$a_{1}$', '$a_{0}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12)

%%
t_15 = out.tout;
a1_15 = out.theta_15.Data(1, :);
a0_15 = out.theta_15.Data(2, :);
b0_15 = out.theta_15.Data(3, :);

figure;
hold on;
grid on;
plot(t_15, a1_15, LineWidth = 1.5);
plot(t_15, a0_15, LineWidth = 1.5);
plot(t_15, b0_15, LineWidth = 1.5);
xlabel("$t$", Interpreter = 'Latex', FontSize = 12);
legend('$a_{1}$', '$a_{0}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12)

%%
t_50 = out.tout;
a1_50 = out.theta_50.Data(1, :);
a0_50 = out.theta_50.Data(2, :);
b0_50 = out.theta_50.Data(3, :);

figure;
hold on;
grid on;
plot(t_50, a1_50, LineWidth = 1.5);
plot(t_50, a0_50, LineWidth = 1.5);
plot(t_50, b0_50, LineWidth = 1.5);
xlabel("$t$", Interpreter = 'Latex', FontSize = 12);
legend('$a_{1}$', '$a_{0}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12)

%%
figure;

subplot(221);
hold on;
grid on;
plot(t_01(1:20000), a1_01(1:20000), LineWidth = 1.5);
plot(t_01(1:20000), a0_01(1:20000), LineWidth = 1.5);
plot(t_01(1:20000), b0_01(1:20000), LineWidth = 1.5);
xlabel("$t$", Interpreter = 'Latex', FontSize = 12);
legend('$a_{1}$', '$a_{0}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12);
title("$\mathbf{\Gamma} = 0.1\mathbf{I}$", ...
      Interpreter = 'Latex', ...
      FontSize = 12);

subplot(222);
hold on;
grid on;
plot(t_1(1:20000), a1_1(1:20000), LineWidth = 1.5);
plot(t_1(1:20000), a0_1(1:20000), LineWidth = 1.5);
plot(t_1(1:20000), b0_1(1:20000), LineWidth = 1.5);
xlabel("$t$", Interpreter = 'Latex', FontSize = 12);
legend('$a_{1}$', '$a_{0}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12);
title("$\mathbf{\Gamma} = \mathbf{I}$", ...
      Interpreter = 'Latex', ...
      FontSize = 12);

subplot(223)
hold on;
grid on;
plot(t_15(1:20000), a1_15(1:20000), LineWidth = 1.5);
plot(t_15(1:20000), a0_15(1:20000), LineWidth = 1.5);
plot(t_15(1:20000), b0_15(1:20000), LineWidth = 1.5);
xlabel("$t$", Interpreter = 'Latex', FontSize = 12);
legend('$a_{1}$', '$a_{0}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12);
title("$\mathbf{\Gamma} = 15\mathbf{I}$", ...
      Interpreter = 'Latex', ...
      FontSize = 12);

subplot(224)
hold on;
grid on;
plot(t_50(1:20000), a1_50(1:20000), LineWidth = 1.5);
plot(t_50(1:20000), a0_50(1:20000), LineWidth = 1.5);
plot(t_50(1:20000), b0_50(1:20000), LineWidth = 1.5);
xlabel("$t$", Interpreter = 'Latex', FontSize = 12);
legend('$a_{1}$', '$a_{0}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12);
title("$\mathbf{\Gamma} = 50\mathbf{I}$", ...
      Interpreter = 'Latex', ...
      FontSize = 12);