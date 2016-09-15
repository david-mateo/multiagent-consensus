function [graph distance] = fermimesh_1dperiodic_graph(L, k, beta=20.)
    % Generalized regular mesh graph using a Fermi distribution (sigmoid)
    % for the weights.
    % See also regularmesh_1dperiodic_graph

    sigmoid=@(x)(1 ./ (1 + e.^(-beta*(k+0.5-x)) )) ;

    [xx yy] = meshgrid(1:L) ;
    distance = abs(xx-yy) ;
    distance = distance + (L-2.*distance).*(distance>floor(L/2)) ;
    graph = sigmoid(distance);
    % Flatten distance for correlation function
    distance = distance(:) ;
    end
