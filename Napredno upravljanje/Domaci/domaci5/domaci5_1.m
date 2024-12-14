%% Funkcija prenosa procesa.
s = tf("s");
Gp = (s + 2) / (s^2 + 5*s + 8);

%% Računanje koeficijenata polinoma R(s) i S(s).
[R, S] = calculateRS(Gp, [1, 3, 3, 1]); 

Rs = tf(R, 1);
Ss = tf(S, 1);

%% Računanje polinoma T(s).
T = 1 / dcgain(1 / Rs * feedback(Gp, Ss / Rs));

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
