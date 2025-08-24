function L = update_estimator(theta)
    a1 = theta(1);
    a0 = theta(2);
    b1 = theta(3);
    b0 = theta(4);

    A = [0, 1; -a0, -a1];
    C = [b0, b1];
    
    L = place(A',C', [-exp(-15*0.001), exp(-15*0.001)])';
end