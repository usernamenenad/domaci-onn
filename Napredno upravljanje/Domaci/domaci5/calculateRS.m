% Upotrebljavati funkciju samo ako nemamo dejstvo poremećaja.
function [R, S] = calculateRS(Gp, W)
    Gp = zpk(Gp);
    n = order(Gp);
    [b, a] = tfdata(Gp, 'v');
    
    syms x;
    
    a = poly2sym(a, x);
    b = poly2sym(b, x);
    r = poly2sym(sym('rho', [1, n]), x);
    s = poly2sym(sym('sigma', [1, n]), x);
    fw = sym(fliplr(W));

    LHS = coeffs(a*r + b*s, x);
    RS = struct2array(solve(LHS == fw));
    
    R = double(RS(1:n));
    S = double(RS(n+1:end));
end