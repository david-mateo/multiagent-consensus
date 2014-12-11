function xp = update_leader( L, x, leader)
	% don't move if leader==1
	xp = update(L, x) ;
	xp(leader==1) = x(leader==1) ;
	end
