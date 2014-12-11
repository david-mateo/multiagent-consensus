function gr = regularize_graph(g)
    % Regularize for threshold consensus:
    % the weight of each connection is
    % 1/(num_neighbors) so that
    % g_ij x_j = sum_{j~i} x_j / sum_{j~i} = <x_j>_{j~i}
	d=length(g) ;
	% first, remove auto-interactions
	gr = g - g.*eye(d)  ;
	% normalize to 1/(num_of_neis+1)
    gr = gr./( sum(gr,2)*ones(1,length(gr)) ) ;
    gr = gr' ;
	end
