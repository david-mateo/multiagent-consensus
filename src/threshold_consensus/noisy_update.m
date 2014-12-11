function xp = noisy_update( g, x, th, eta)
    xp = (x*g + eta.*(rand(size(x))-0.5) > th) ;
    end
