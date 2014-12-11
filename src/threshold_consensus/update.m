function xp = update(g, x, th)
    % xp(i) is 1 if <x_j>_{j~i} is bigger than th,
    % is 0 otherwise.
    % For simple majority vote th=0.5.
    xp = (x*g > th) ;
    end
