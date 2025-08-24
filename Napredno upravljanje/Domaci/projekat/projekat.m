Ts = 1e-3;
Tf = 1e-2;

%% Sistem
s = tf("s");

a0 = 8;
a1 = 7;
b0 = 5;

A = [0, 1; -a0, -a1];
B = [0; b0];

sysc = ss(A, B, [1, 0], 0);
Gc = tf(sysc);

%% Diskretizacija
Gd = c2d(Gc, Ts);
sysd = ss(Gd);

a1d = Gd.Denominator{1, 1}(2);
a0d = Gd.Denominator{1, 1}(3);
b1d = Gd.Numerator{1, 1}(2);
b0d = Gd.Numerator{1, 1}(3);

Ad = [0, 1; -a0d, -a1d];
Bd = [0; 1];
Cd = [b0d, b1d];

%% 
b2f = (1 - exp(-Ts/Tf))^2 * exp(-Ts/Tf);
b1f = (1 - exp(-Ts/Tf))^2;
a2f = exp(-2*Ts/Tf);
a1f = -2*exp(-Ts/Tf);

z = tf('z');
Gf = minreal((b1f*z^(-1) + b2f*z^(-2)) / (1 + a1f*z^(-1) + a2f*z^(-2)));

%%
z = tf("z");
p_k = [exp(-5*Ts), exp(-5*Ts)];
K = acker(Ad, Bd, p_k);
Akd = Ad - Bd * K;

G0 = Cd * inv(z*eye(2) - Akd) * Bd;

kr = 1 / dcgain(G0);
R = 5;

%% Estimator
p_est = [-exp(-10*Ts), exp(-10*Ts)];
L = acker(Ad', Cd', p_est)';

