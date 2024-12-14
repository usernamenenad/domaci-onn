%% Primjer sa poremećajem prirode h(t) - diskretan sistem.
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

%% Primjer sa poremećajem prirode sin(t) - diskretan sistem.
Ts = 0.001;
z = tf("z", Ts);
Gpd = 0.1 * z^(-2) / (1 + 0.3 * z^(-1))^2;

w = 2;
c = cos(w * Ts);
s = sin(w * Ts);

% Simboličko računanje ovaj put, lakše je za rješavanje

% x = z^-1
syms x;

% Koeficijenti polinoma R0(z) i S(z)
syms r0 r1 r2 s0 s1 s2 s3;

As = (1 + 0.3 * x)^2;
Bs = 0.1 * x^2;
R0s = 1 + r2 * x + r1 * x^2 + r0 * x^3;
Ss = s3 + s2 * x + s1 * x^2 + s0 * x^3;

fcl = As * (1 - 2 * c * x + x^2) * R0s + s * x * Bs * Ss;
fw = (1 - 0.1 * x)^7;

LHS = coeffs(fcl, x);
RHS = coeffs(fw, x);

sol = solve(LHS == RHS);

R0 = tf(double([1, sol.r2, sol.r1, sol.r0]), 1, Ts);
R0.Variable = 'z^-1';

R = (1 - 2 * c * z^(-1) + z^(-2)) / (s * z^(-1)) * R0;

S = tf(double([sol.s3, sol.s2, sol.s1, sol.s0]), 1, Ts);
S.Variable = 'z^-1';

T = 1 / dcgain(minreal(1 / R * feedback(Gpd, S / R), 1e-2));

%% Ako polinom R(z) daje nestabilne polove, iskoristiti ispod i prilagoditi šemu.
Feedforward = minreal(T / S, 1e-2);
Feedback = minreal(S / R, 1e-2);

%%
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
ylim([-1, 6]);
% xticks(0:0.002:0.03);
legend('$r(t)$', '$d(t)$', '$y(t)$', ... 
       Interpreter = 'Latex', ...
       FontSize = 10);