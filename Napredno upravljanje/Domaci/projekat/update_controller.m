function K = update_controller(theta)
    a1 = theta(1);
    a0 = theta(2);

    A = [0, 1; -a0, -a1];
    B = [0; 1];
    
    K = acker(A, B, [exp(-5*0.001), exp(-5*0.001)]);
end