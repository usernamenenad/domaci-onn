%% Statički sistem
clear;
clc;

t = -10:0.01:10;
u = @(t) 2 * heaviside(t);
y = @(t, u) 3 * u(t) + 7;

plot(t, u(t), 'LineWidth', 1.5);
hold on;
plot(t, y(t, u), 'LineWidth', 1.5);
grid on;
ylim([0, 15]);
legend('$u(t)$', '$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);

%% Odnos u(t) i y(t) kod statičkih sistema
plot(u(t), y(t, u), 'LineWidth', 1.2);
grid on;
ylim([0, 15]);
xlabel('$u(t)$', 'Interpreter', 'Latex', 'FontSize', 12);
ylabel('$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);

%% Statički sistem (ali zakašnjen)
clear;
clc;

t = -10:0.01:10;
u = @(t) 2 * heaviside(t);
y = @(t, u) 3 * u(t) + 7;

plot(t, u(t), 'LineWidth', 1.5);
hold on;
plot(t, y(t - 3, u), 'LineWidth', 1.5);
grid on;
ylim([0, 15]);
legend('$u(t)$', '$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);

%% Dinamički sistem (opisan diferencijalnim jednačinama)
clear;
clc; 
t = linspace(0, 4*pi, 1000);
u = @(t) sin(t);
system_dyn = @(t, x) (-3) * x + 2 * u(t);
[~, y_dyn] = ode45(system_dyn, t, 0);

plot(u(t), y_dyn, 'LineWidth', 1.5);
grid on;
xlabel('$u(t)$', 'Interpreter', 'Latex', 'FontSize', 12);
ylabel('$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);

%% Potrebno za linearni vs nelinearni sistemi
clear;
clc;

Ts = 0.001;
fs = 1 / Ts;
t = 0:Ts:10;
N = 10;
f = 1;

system_linear = @(t, x, u, p) -3 * x + 2 * u(p);
system_nonlinear = @(t, x, u, p) -x^3 + 3 * cos(2 * u(p));

%% Princip superpozicije (linearan sistem)
u1 = @(t) sin(2 * pi * 10 * t);
u2 = @(t) sin(2 * pi * 20 * t);
u12 = @(t) sin(2 * pi * 10 * t) + sin(2 * pi * 20 * t);

[~, y_sl1] = ode45(@(t, x) system_linear(t, x, u1, t), t, 0);
[~, y_sl2] = ode45(@(t, x) system_linear(t, x, u2, t), t, 0);
[~, y_slc] = ode45(@(t, x) system_linear(t, x, u12, t), t, 0);

subplot(311);
plot(t, y_sl1, 'Color', 'blue');
title("Odziv na pobudu $u(t) = \sin{(2 \pi \cdot 10Hz \cdot t)}$", 'Interpreter', 'Latex', 'FontSize', 12);
xlabel('$t$', 'Interpreter', 'Latex', 'FontSize', 12);
ylabel('$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);
grid on;

subplot(312);
plot(t, y_sl2, 'Color', 'red');
title("Odziv na pobudu $u(t) = \sin{(2 \pi \cdot 20Hz \cdot t)}$", 'Interpreter', 'Latex', 'FontSize', 12);
xlabel('$t$', 'Interpreter', 'Latex', 'FontSize', 12);
ylabel('$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);
grid on;

subplot(313);
plot(t, y_slc, 'Color', 'blue');
title("Superpozicija", 'Interpreter', 'Latex', 'FontSize', 12);
xlabel('$t$', 'Interpreter', 'Latex', 'FontSize', 12);
ylabel('$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);
grid on;
hold on;
plot(t, y_sl1 + y_sl2, 'Color', 'red');
legend('$y = \mathcal{S}(u_{1} + u_{2})$', '$y = \mathcal{S}(u_{1}) + \mathcal{S}(u_{2})$', 'Interpreter', 'Latex', 'FontSize', 12);

%% Princip superpozicije (nelineran sistem)
u1 = @(t) sin(2 * pi * 10 * t);
u2 = @(t) sin(2 * pi * 20 * t);
u12 = @(t) sin(2 * pi * 10 * t) + sin(2 * pi * 20 * t);

[~, y_snl1] = ode45(@(t, x) system_nonlinear(t, x, u1, t), t, 0);
[~, y_snl2] = ode45(@(t, x) system_nonlinear(t, x, u2, t), t, 0);
[~, y_snlc] = ode45(@(t, x) system_nonlinear(t, x, u12, t), t, 0);

subplot(311);
plot(t, y_snl1, 'Color', 'blue');
title("Odziv na pobudu $u(t) = \sin{(2 \pi \cdot 10Hz \cdot t)}$", 'Interpreter', 'Latex', 'FontSize', 12);
xlabel('$t$', 'Interpreter', 'Latex', 'FontSize', 12);
ylabel('$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);
grid on;

subplot(312);
plot(t, y_snl2, 'Color', 'red');
title("Odziv na pobudu $u(t) = \sin{(2 \pi \cdot 20Hz \cdot t)}$", 'Interpreter', 'Latex', 'FontSize', 12);
xlabel('$t$', 'Interpreter', 'Latex', 'FontSize', 12);
ylabel('$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);
grid on;

subplot(313);
plot(t, y_snlc, 'Color', 'blue');
title("Superpozicija", 'Interpreter', 'Latex', 'FontSize', 12);
xlabel('$t$', 'Interpreter', 'Latex', 'FontSize', 12);
ylabel('$y(t)$', 'Interpreter', 'Latex', 'FontSize', 12);
grid on;
hold on;
plot(t, y_snl1 + y_snl2, 'Color', 'red');
legend('$y = \mathcal{S}(u_{1} + u_{2})$', '$y = \mathcal{S}(u_{1}) + \mathcal{S}(u_{2})$', 'Interpreter', 'Latex', 'FontSize', 12);

%% Frekvencijski spektar
tL = t >= 6; % Ustaljeno stanje (otp., može proizvoljno, ali samo dovoljno da prođe tranzijent).
u = harmonics(N, f, t);
U = fftshift(fft(u(tL)));

faxis = linspace(-fs/2, fs/2, length(t(tL)));
L = faxis >= 0 & faxis <= 15;

[~, y_linear] = ode45(@(t, x) system_linear(t, x, @(t) harmonics(N, f, t), t), t, 0);
[~, y_nonlinear] = ode45(@(t, x) system_nonlinear(t, x, @(t) harmonics(N, f, t), t), t, 0);

%% Linearni sistem
Y_linear = fftshift(fft(y_linear(tL)));

figure;

subplot(211)
stem(faxis(L), abs(U(L)), 'LineWidth', 1.2);
grid on;
xlabel("$f$ [Hz]", 'Interpreter', 'Latex', 'FontSize', 12);
ylabel("$|U(j\omega)|$", 'Interpreter', 'Latex', 'FontSize', 12);

subplot(212)
stem(faxis(L), abs(Y_linear(L)), 'LineWidth', 1.2);
grid on;
xlabel("$f$ [Hz]", 'Interpreter', 'Latex', 'FontSize', 12);
ylabel("$|Y(j\omega)|$", 'Interpreter', 'Latex', 'FontSize', 12);

%% Nelinearni sistem
Y_nonlinear = fftshift(fft(y_nonlinear(tL)));

figure;

subplot(211)
stem(faxis(L), abs(U(L)), 'LineWidth', 1.2);
grid on;
xlabel("$f$ [Hz]", 'Interpreter', 'Latex', 'FontSize', 12);
ylabel("$|U(j\omega)|$", 'Interpreter', 'Latex', 'FontSize', 12);

subplot(212);
stem(faxis(L), abs(Y_nonlinear(L)), 'LineWidth', 1.2);
xticks(0:15);
grid on;
xlabel("$f$ [Hz]", 'Interpreter', 'Latex', 'FontSize', 12);
ylabel("$|Y(j\omega)|$", 'Interpreter', 'Latex', 'FontSize', 12);

%% Bode dijagram
clear;
clc;

Ts = 0.001; 
fs = 1 / Ts;
t = 0:Ts:10;
N = 40000;
f_b = 0.001;

u = @(t) harmonics(N, f_b, t);

system = @(t, x) -2 * x + 3 * u(t);
[~, x] = ode45(system, t, 0);
y = 3 * x;

%%
U = fftshift(fft(u(t)));
Y = fftshift(fft(y'));
G_mag = 20 * log10(abs(Y ./ U));
waxis = linspace(-fs * pi, fs * pi, length(t));
wmin = 2 * fs * pi / length(t);
wmax = fs * pi;

semilogx(waxis(waxis >= 0), G_mag(waxis >= 0), 'LineWidth', 1, 'LineStyle', '--');
grid on;
hold on;
xlim([wmin, wmax]);
xlabel('$\omega$[log]', 'Interpreter', 'Latex', 'FontSize', 12);

s = tf("s");
G = 9 / (s + 2);
[mag, ~, ~] = bode(G, waxis(waxis >= 0));
plot(waxis(waxis >= 0), 20 * log10(mag(:)), 'LineWidth', 1.2);
legend('Amplitudski spektar dobijen identifikacijom', 'Prava funckija prenosa', 'FontSize', 12);