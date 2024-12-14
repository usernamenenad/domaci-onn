Tf = 1;

t = out.tout;
a_1 = out.theta.Data(1, :);
a_0 = out.theta.Data(2, :);
b_1 = out.theta.Data(3, :);
b_0 = out.theta.Data(4, :);

%%
plot(t(1:end-2), a_1, LineWidth = 1.2);
hold on;
plot(t(1:end-2), a_0, LineWidth = 1.2);
plot(t(1:end-2), b_1, LineWidth = 1.2);
plot(t(1:end-2), b_0, LineWidth = 1.2);
grid on;
legend('$a_{1}$', '$a_{0}$', '$b_{1}$', '$b_{0}$', ...
       Interpreter = 'Latex', ...
       FontSize = 12);
xlabel('$t$', Interpreter = 'Latex', FontSize = 12);

% [-dot_y; -y; dot_u; u];