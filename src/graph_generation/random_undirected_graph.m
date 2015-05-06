function g = random_undirected_graph(dim, density)
    % Undirected: i connected to j iff j connected to i.
    % dim       = (int) dimension. the resulting graph
    %             has dim x dim elements.
	% density   = (float) density of connections, i.e.
	%             probability of (i,j) to be connected.
	r = rand(dim) ;
	g = 0.5*(r + r')<density ;
	end
