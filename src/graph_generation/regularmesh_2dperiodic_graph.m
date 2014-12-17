function [graph distance] = regularmesh_2dperiodic_graph(Lx, Ly, k)
    % Same as ising_2d_graph with periodic conditions (a mesh in a torus).
    [ii jj] = meshgrid(0:Lx*Ly-1) ;
    dx = abs(mod(ii,Lx)-mod(jj,Lx)) ;
    dy = abs(floor(ii./Lx)-floor(jj./Lx))  ;
    distance = dx + (Lx-2.*dx).*(dx>floor(Lx/2)) + dy + (Ly-2.*dy).*(dy>floor(Ly/2)) ;
    graph = distance <= k ;
    % Flatten distance for correlation function
    distance = distance(:) ;
    end
