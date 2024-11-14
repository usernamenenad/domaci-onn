%% Primjer sa poremećajem prirode h(t) - kontinualan sistem.
Ts = 0.001;
z = tf("z", Ts);
Gpd = 0.1 / (z + 0.3)^2;

% x = [rho0; sigma2; sigma1; sigma0].
% Dobijeno iz rješavanja sistema jednačina.
A = [1, 0, 0, 0; ...
     -0.4, 0.1, 0, 0; ...
     -0.51, 0, 0.1, 0; ...
     -0.09, 0, 0, 0.1];

b = [0; 0.57; 0.086; 0.0001];

RS = A \ b;

Rd = [1, RS(1) - 1, -RS(1)];
Sd = RS(2:end)';

Rsd = tf(Rd, 1, Ts);
Ssd = tf(Sd, 1, Ts);
Tsd = 1 / dcgain(minreal(1/Rsd * feedback(Gpd, Ssd/Rsd)));

t = out.tout;
y = out.y.Data(:, 1);
r = out.r.Data(:, 1);
d = out.d.Data(:, 1);

stairs(t, r, LineWidth=1.5);
hold on;
grid on;
stairs(t, d, LineWidth=1.5);
stairs(t, y, LineWidth=1.5);
xlabel("$t$", Interpreter='Latex', FontSize=12)
ylim([0, 6]);
xticks(0:0.002:0.015);
legend('$r(t)$', '$d(t)$', '$y(t)$', ... 
       Interpreter = 'Latex', ...
       FontSize = 10);