function xp = noisy_update( L, x, eta)
	xp = update(L,x) +  eta.*(rand(size(x))-0.5);
	end
