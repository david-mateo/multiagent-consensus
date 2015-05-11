function g = random_undirected_graph(dim, density)
    % Undirected: i connected to j iff j connected to i.
    % i always disconnected with i.
    % dim       = (int) dimension. the resulting graph
    %             has dim x dim elements.
	% density   = (float) density of connections, i.e.
	%             probability of (i,j) to be connected.
	r = rand(dim) ;
    % Dont use Asym = (A+A')/2 because rands stop being uniform.
    r = tril(r,-1) + tril(r,-1)' ;
	g = r<density ;
	end
