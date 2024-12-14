%% Primjer sa poremećajem prirode h(t) - kontinualan sistem.
s = tf("s");
Gpk = 1 / (s * (s + 1));

% x = [rho0; sigma2; sigma1; sigma0].
% Dobijeno iz rješavanja sistema jednačina.
A = [1, 0, 0, 0; ...
     1, 1, 0, 0; ...
     0, 0, 1, 0; ...
     0, 0, 0, 1];
b = [11; 54; 108; 81];
RS = A \ b;

Rk = [1, RS(1), 0];
Sk = RS(2:end)';

Rsk = tf(Rk, 1);
Ssk = tf(Sk, 1);
Tsk = 1 / dcgain(1/Rsk * feedback(Gpk, Ssk/Rsk));

t = out.tout;
y = out.y.Data(:, 1);
r = out.r.Data(:, 1);
d = out.d.Data(:, 1);

stairs(t, r, LineWidth=1.5);
hold on;
grid on;
stairs(t, d, LineWidth=1.5);
plot(t, y, LineWidth=1.5);
xlabel("$t$", Interpreter='Latex', FontSize=12)
ylim([0, 6]);
xticks(0:2:15);
legend('$r(t)$', '$d(t)$', '$y(t)$', ... 
       Interpreter = 'Latex', ...
       FontSize = 10);

%% Primjer sa poremećajem prirode sin(t) - kontinualan sistem.
s = tf("s");
Gpk = 1 / (s * (s + 1));

w = 20;

% x = [rho0; sigma3; sigma2; sigma1; sigma0].
% Dobijeno iz rješavanja sistema jednačina.
A = [1, 0, 0, 0, 0; ...
     1, 1, 0, 0, 0; ...
     w^2, 0, 1, 0, 0; ...
     w^2, 0, 0, 1, 0; ...
     0, 0, 0, 0, 1];
b = [14; 86; 266; 405; 243];
RS = A \ b;

Rk = [1, RS(1), w^2, w^2 * RS(1)];
Sk = RS(2:end)';

Rsk = tf(Rk, 1);
Ssk = tf(Sk, 1);
Tsk = 1 / dcgain(1/Rsk * feedback(Gpk, Ssk/Rsk));

t = out.tout;
y = out.y.Data(:, 1);
r = out.r.Data(:, 1);
d = out.d.Data(:, 1);

stairs(t, r, LineWidth=1.5);
hold on;
grid on;
plot(t, d, LineWidth=1.5);
plot(t, y, LineWidth=1.5);
xlabel("$t$", Interpreter='Latex', FontSize=12)
ylim([-1, 6]);
xticks(0:2:15);
legend('$r(t)$', '$d(t)$', '$y(t)$', ... 
       Interpreter = 'Latex', ...
       FontSize = 10);
