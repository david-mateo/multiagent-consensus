function [graph distance] = ising_1dperiodic_graph(L, k)
    % Same as ising_1d_graph with periodic conditions (a ring).
    % node_1 is surrounded by node_2 and node_N.
    [xx yy] = meshgrid(1:L) ;
    distance = abs(xx-yy) ;
    distance = distance + (L-2.*distance).*(distance>floor(L/2)) ;
    graph = distance <= k ;
    % Flatten distance for correlation function
    distance = distance(:) ;
    end
