function corr = correlation(dx, dists, maxd)
	corr = zeros(1,maxd) ;
	ddx = (dx'*dx)(:) ;
	for i=1:maxd
		corr(i) = sum(ddx(dists==i))/sum(dists==i) ; 
		end
	end
