function corr = ising_correlation(L,k, dt, eta, niter,out)
    addpath('../src/graph_generation/')
    addpath('../src/linear_consensus/')
    [graph dists] = ising_2dperiodic_graph(L,L,k) ;
    p = protocol(dt, graph);
    maxd = max(dists) ;
	corr = zeros(1,maxd) ;
	count = 0 ;
	x = zeros(1,L*L) ;
	x = noisy_update(p, x, eta) ;
    for i=1:niter
		%x = noisy_update(p, x, eta) ;
		if mod(i, out)==0
			corr += correlation( displacement(x) , dists, maxd) ;
			count += 1 ;
			end
		end
	corr /= count ;
end	

