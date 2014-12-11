function gr = regularize_graph_autoint(g)
    % Same as regulaize_graph but with auto-interactions
    % (each node is connected to itself).
	d=length(g) ;
	% add auto-interactions
	gr = g - g.*eye(d) + eye(d) ;
	% normalize to 1/(num_of_neis+1)
    gr = gr./( sum(gr,2)*ones(1,length(gr)) ) ;
    gr = gr' ;
	end
