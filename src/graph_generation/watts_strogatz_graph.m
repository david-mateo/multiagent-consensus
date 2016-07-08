    function graph = watts_strogatz_graph(nag, k, p)
    % Smallworld graph according to Watts-Strogatz model
    %   (see Nature 393 (6684): 440–442. doi:10.1038/30918)
    % 
    % nag       = (int) number of nodes.
    % k         = (int) interaction length of the underlying
    %               regular network. Each edge has an average
    %               of 2*k neighbors.
    % p         = (float) Probability of re-wiring *per edge*.
    %               Rewiring is defined as changing one end
    %               of the node such as no duplicates or
    %               self-connections occur. This means that
    %               a rewiring can change a node to itself.
    %
    graph = regularmesh_1dperiodic_graph(nag, k) ;
    [is,js] = find(triu(graph,1)) ;
    vertexs = [is,js]' ;
    nvertexs = length(vertexs) ; % should be = nag*k. 
    to_remove = randperm(nvertexs,binornd(nvertexs,p)) ;
    %nodes_to_remove=nodes(:,to_remove);
    for vertex=vertexs(:,to_remove)
        i = vertex(1) ; j = vertex(2) ;
        % 1. Remove this edge
        graph(i,j)=0 ;
        graph(j,i)=0 ;
    end
    % Count the number of edges to add for each vertex
    nnew=hist(is(to_remove),1:nag) ;
    for i=1:nag
        if nnew(i)>0
            % select nnew(i) new vertexs.
            not_vertexs=find(not(graph(i,:))) ;
            js = not_vertexs(randperm(length(not_vertexs), nnew(i)) ) ;
            graph(i,js)=1 ;
            graph(js,i)=1 ;
        end
    end
    graph = graph - graph.*eye(nag) ;
end
