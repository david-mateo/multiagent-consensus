function g = small_world_graph(dim, k)
    % Each node is randomly connected to
    % other k nodes EXCLUDING itself.
    % dim       = (int) dimension. the resulting graph
    %             has dim x dim elements.
    % k         = (int) outdegree. Number of edges per node.
	g = zeros(dim) ;
	for i=1:dim
        % WARNING: This works in Matlab and Octave 
		r = randperm(dim-1)(1:k) ; % k random numbers from 1 to dim-1 wout repetition.
		neis=(1:dim)(1:dim!=i) ;
        neis= neis(r) ;
		g(i,neis) = 1 ;
		end
	end
