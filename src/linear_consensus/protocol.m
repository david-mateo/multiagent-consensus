function p = protocol(dt, graph)
	% defined such that
	%  x(t+dt) = x(t)*p
	d=length( graph ) ;
	p = eye(d) + dt.*graph' ;
	end
