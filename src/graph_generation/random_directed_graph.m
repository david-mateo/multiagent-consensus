function g = random_directed_graph(dim, density)
    % Directed: i connected to j independent of j connected to i.
    % dim       = (int) dimension. the resulting graph
    %             has dim x dim elements.
	% density   = (float) density of connections, i.e.
	%             probability of (i,j) to be connected.
	r = rand(dim) ;
	g = r>density ;
	end
