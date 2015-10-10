function xp = update(neis, x)
    % The new state of each agent
    % is copied from the state of
    % one random neighbor.
    % Synchronous update.
    xp = zeros(size(x)) ;
    for i=1:numel(x)
        xp(i) = x( neis{i}(randi(numel(neis{i})))) ;
    end
