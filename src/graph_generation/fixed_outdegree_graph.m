function g = fixed_outdegree_graph(dim, k)
    % Each node is randomly connected to
    % other k nodes EXCLUDING itself.
    % dim       = (int) dimension. the resulting graph
    %             has dim x dim elements.
    % k         = (int) outdegree. Number of edges per node.
	g = zeros(dim) ;
	for i=1:dim
        % temporary storage needed for compatibility with Matlab
		r = randperm(dim-1) ; r = r(1:k) ; % k random numbers from 1 to dim-1 wout repetition.
		neis=[1:i-1 i+1:dim] ;
        neis= neis(r) ;
		g(i,neis) = 1 ;
		end
	end
