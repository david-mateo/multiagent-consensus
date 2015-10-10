function [neis , nn] = regularize_graph(g)
    % Regularize for voter consensus:
    % Return a cell containing a list of neighbors
    % for each agent.
    % Optional: also return the number of neighbors
    % of each agent.
	d=length(g) ;
	% first, remove auto-interactions
	%g = g - g.*eye(d)  ;
    for i=1:d
        g(i,i) = 0 ;
    end
    neis = {} ;
    for i=1:d
        neis{i} = (1:d)(g(i,:)) ;
        if numel(neis{i})==0
            neis{i} = i ;
        end
    end
    % number of neis:
    nn = cellfun("length",neis) ;
	end
