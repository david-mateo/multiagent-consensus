function [graph distance] = fermimesh_2dperiodic_graph(Lx, Ly, k, beta=20.)
    % Generalized regular mesh graph using a Fermi distribution (sigmoid)
    % for the weights.
    % See also regularmesh_2dperiodic_graph

    sigmoid=@(x)(1 ./ (1 + e.^(-beta*(k+0.5-x)) )) ;

    % Same as ising_2d_graph with periodic conditions (a mesh in a torus).
    [ii jj] = meshgrid(0:Lx*Ly-1) ;
    dx = abs(mod(ii,Lx)-mod(jj,Lx)) ;
    dy = abs(floor(ii./Lx)-floor(jj./Lx))  ;
    distance = dx + (Lx-2.*dx).*(dx>floor(Lx/2)) + dy + (Ly-2.*dy).*(dy>floor(Ly/2)) ;
    graph = sigmoid(distance);
    % Flatten distance for correlation function
    distance = distance(:) ;
    end
