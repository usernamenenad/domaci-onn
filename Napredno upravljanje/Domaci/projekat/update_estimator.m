function L = update_estimator(theta)
    a1 = theta(1);
    a0 = theta(2);
    b1 = theta(3);
    b0 = theta(4);

    A = [0, 1; -a0, -a1];
    B = [0; 1];
    C = [b0, b1];
    Aw = 0;
    Cw = 1;

    A_bar = [A, B * Cw; 0, 0, Aw];
    C_bar = [C, 0];

    p_est = [-exp(-15*0.001), exp(-16*0.001), exp(-17*0.001)];
    L = place(A_bar', C_bar', p_est)';
end