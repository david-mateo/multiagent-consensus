function gr = regularize_graph(g)
    % Regularize for linear consensus:
    % the weight of each connection is
    % 1/num_neighbors, and the diagonal
    % is -1 to compute the relative mean,
    % g_ij x_j = sum_{j~i} (x_j-x_i) / sum_{j~i}
	d=length(g) ;
	% first, take out auto-interaction
	gr = g - g.*eye(d) ;
	% set diagonal to -num_of_neis
    gr = gr./( sum(gr,2)*ones(1,length(gr)) ) - eye(d) ;
	end
