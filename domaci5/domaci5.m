%% Funkcija prenosa procesa.
s = tf("s");
Gp = (s + 2) / (s^2 + 5*s + 8);

%% Računanje koeficijenata polinoma R(s) i S(s).
[R, S] = calculateRS(Gp, [1, 3, 3, 1]); 

Rs = tf(R, 1);
Ss = tf(S, 1);

%% Računanje polinoma T(s).
T = 1 / dcgain(1/Rs * feedback(Gp, Ss/Rs));

%% Grafici r(t) i y(t).
t = out.tout;
y = out.y.Data(:, 1);
r = out.r.Data(:, 1);

stairs(t, r, LineWidth=1.5);
hold on;
grid on;
plot(t, y, LineWidth=1.5);
xlabel("$t$", Interpreter='Latex', FontSize=12)
ylim([0, 6]);
legend('$r(t)$', '$y(t)$', ... 
       Interpreter = 'Latex', ...
       FontSize = 10);

%% Primjer sa poremećaj - kontinualan sistem.
s = tf("s");
Gpk = 1 / (s * (s + 1));

% x = [rho0; sigma2; sigma1; sigma0].
% Dobijeno iz rješavanja sistema jednačina.
A = [1, 0, 0, 0; 1, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
b = [11; 54; 108; 81];
RS = A \ b;

Rk = [1, RS(1)', 0];
Sk = RS(2:end)';

Rsk = tf(Rk, 1);
Ssk = tf(Sk, 1);
Tk = 1 / dcgain(1/Rsk * feedback(Gpk, Ssk/Rsk));

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