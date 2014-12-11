function [graph distance] = ising_2d_graph(Lx, Ly, k)
    % 2D regular mesh.
    % Lx        = (int) length of the mesh in x-axis.
    % Ly        = (int) length of the mesh in y-axis.
    %              N = Lx*Ly
    % k         = (int) interaction length. Each
    % node is connected with nodex at a distance
    % equal or less than k.
    % For k=1, each node has 4 edges; for k=2 12 edges etc.
    % distance  = flattened vector with the distances
    % between points. Useful for correlations.
    % Can be ignored.
    [ii jj] = meshgrid(0:Lx*Ly-1) ;
    distance = abs(mod(ii,Lx)-mod(jj,Lx))+abs(floor(ii./Lx)-floor(jj./Lx))  ;
    graph = distance <= k ;
    % Flatten distance for correlation function
    distance = distance(:) ;
    end
