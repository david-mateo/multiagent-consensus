function xp = update_leader(neis, x, leader)
    % The new state of each agent
    % is copied from the state of
    % one random neighbor.
    % Synchronous update.
    % The array "leader" defines which
    % agents don't update their state.
    xp = zeros(size(x)) ;
    for i=1:numel(x)
        xp(i) = x( neis{i}(randi(numel(neis{i})))) ;
    end
	xp(leader==1) = x(leader==1) ;
end
