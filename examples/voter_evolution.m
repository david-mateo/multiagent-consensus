function voter_evolution(n, k, nleads, runs, times)
    addpath('../src/graph_generation/')
    addpath('../src/voter_consensus/')

    g = regularmesh_1dperiodic_graph( n , k/2) ;
    neis = regularize_graph(g) ;

    means = zeros(1,times) ;
    for r=1:runs
        agentleads = randperm(n,nleads) ;
        x = zeros(1,n) ;
        x(agentleads) = 1 ;
        leaders = x ;
        for t=1:times
            x = update_leader(neis,x,leaders) ;
            means(t) = mean(x) ;
        end
    end

    means /= times ;

    for t=1:times
        printf('%i\t%f\n',t,means(t)) ;
    end
end
