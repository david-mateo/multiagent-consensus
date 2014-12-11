function xp = update_leader( g, x, th, leaders)
    % keep the nodes in the list 'leaders' fixed.
    % leaders   = (*int) list of nodes.
	xp = update(g, x, th) ;
	xp(leaders==1) = x(leaders==1) ;
	end
