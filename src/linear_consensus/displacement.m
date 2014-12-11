function dx = displacement(x)
	xm = mean(x) ;
	dx = x - xm;
	s2 = mean(dx.*dx);
	dx /= sqrt(s2) ;
	end
