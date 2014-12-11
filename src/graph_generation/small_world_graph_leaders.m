function g = small_world_graph_leaders(dim, k, indxs)
	% small world network where the nodes in 'indxs'
	% are leaders and therefore don't have edges.
    % dim       = (int) dimension. the resulting graph
    %             has dim x dim elements.
    % k         = (int) outdegree. Number of edges per node.
	% indx      = (*int) list of nodes that are leaders.
    g = small_world_graph(dim, k) ;
	g(indxs , :) = 0 ;
	end
