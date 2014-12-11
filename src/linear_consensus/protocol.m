function p = protocol(dt, graph)
	% defined such that
	%  x(t+dt) = x(t)*p
	d=length(regularize_graph( graph) ) ;
	p = eye(d) + dt.*graph' ;
	end
