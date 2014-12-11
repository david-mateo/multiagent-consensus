function xp = async_update( g, x, th)
	% update asynchronously as many
	% randomly selected (with repetition)
	% edges as the number of edges in x.
	xp = x ;
	nedges = length(x) ;
	for i=1:nedges
		idx = unidrnd(nedges) ;
		xp(idx) = xp*g(:,idx) > th ;
		end
	end
