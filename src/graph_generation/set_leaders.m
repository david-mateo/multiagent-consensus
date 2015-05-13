function graph = set_leaders(graph, leaders)
	% remove the indegrees of the leaders so they 
    % influence other nodes but are not influenced by them.
    %   graph   = NxN matrix with g_ij = 1 if i is connected
    %             to j and 0 otherwise. The size must be
    %             N >= dim(leaders).
    graph(leaders, :) = 0 ;
	end
