s = tf("s");
Gk = (s + 4) / (s^2 + 5*s + 6);
Tf = 1;

%%
Eta = out.ddot_y_f.Data;
Phi = [-out.dot_y_f.Data, -out.y_f.Data, out.dot_u_f.Data, out.u_f.Data];

Theta = Phi \ Eta;

%%
Ts = 0.0001;
Tf = 1;
z = tf("z", Ts);
Gz = (z - 0.2) / (z^2 - 0.4*z + 0.03);

%%
Eta = out.z2_yd_f.Data;
Phi = [-out.z1_yd_f.Data, -out.yd_f.Data, out.z1_ud_f.Data, out.ud_f.Data];

Theta = Phi \ Eta;