function s = harmonics(N, f, t)
    s = 0;
    for i = 1:N
        s = s + sin(2 * pi * i * f * t);
    end
end