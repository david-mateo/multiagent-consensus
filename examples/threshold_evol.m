function xm = threshold_evol( nag, nleads, k, th, niter)
    addpath('../src/graph_generation/') ;
    addpath('../src/threshold_consensus/') ;
    % Choose random leaders
    leaders = zeros(1,nag) ;
    leaders(randperm(nag)(1:nleads)) = ones(1,nleads) ;
    g = fixed_outdegree_graph(nag, k) ;
    g = regularize_graph(g) ;
    % Initial state
    x =zeros(1,nag) ;
    x(leaders==1) = ones(1,nleads) ;

    xm = zeros(niter,1) ;
    xm(1) = mean(x(leaders==0)) ;
    for iter=2:niter
        x = update_leader(g, x, th, leaders) ;
        xm(iter) = mean(x(leaders==0)) ;
        end
    plot(1:niter,xm)
    end
