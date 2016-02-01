function graph = smallworld(nag, k, p)
    % Smallworld graph according to Watts-Strogatz model
    %   (see Nature 393 (6684): 440–442. doi:10.1038/30918)
    % 
    % nag       = (int) number of nodes.
    % k         = (int) interaction length of the underlying
    %               regular network. Each node has an average
    %               of 2*k neighbors.
    % p         = (float) Probability of re-wiring *per node*.
    %               Rewiring is defined as changing one end
    %               of the node such as no duplicates or
    %               self-connections occur. This means that
    %               a rewiring can change a node to itself.
    %
    graph = regularmesh_1dperiodic_graph(nag, k) ;
    [is,js] = find(triu(graph,1)) ;
    nodes = [is,js] ;
    for node=nodes'
        if rand()<p
            i = node(1) ; j = node(2) ;
            % 1. Remove this edge
            graph(i,j)=0 ;
            graph(j,i)=0 ;
            % 2. Replace it by new edge. May be the same as before.
            not_nodes = find(not(graph(i,:))) ;
            j = not_nodes(randi(length(not_nodes))) ;
            graph(i,j)=1 ;
            graph(j,i)=1 ;
        end
    end
    graph = graph - graph.*eye(nag) ;
end
