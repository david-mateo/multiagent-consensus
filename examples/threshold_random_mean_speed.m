function threshold_random_mean_speed(nag, nleads, dens , runs, threshold)
    addpath('../src/graph_generation/')
    addpath('../src/threshold_consensus/')
    fprintf('# Voter consensus\n# Num agents        %i\n# Num leaders       %i\n# Runs              %i\n',nag, nleads, runs) ;
    for den=dens
        s = zeros(runs,1) ;
        for r=1:runs
            g = random_undirected_graph(nag, den) ;
            g = regularize_graph(g) ;
            sp = speed_threshold( nag, nleads, g, threshold) ;
            s(r) = sp ;
            end
        %x = arrayfun( @(r) polarization_voters( nag, nleads, k) , 1:runs) ;
        fprintf('%f\t%f\t%f\n',den,mean(s),std(s) ) ;
        end
    end

function [speed xm] = speed_threshold( nag, nleads, graph, th)
    % Choose random leaders
    leaders = zeros(1,nag) ;
    leaders(randperm(nag)(1:nleads)) = ones(1,nleads) ;
    % Initial state
    x =zeros(1,nag) ;
    x(leaders==1) = ones(1,nleads) ;

    niter=5 ;
    xm = zeros(niter,1) ;
    for iter=1:niter
        xold = x ;
        x = update_leader(graph, x, th, leaders) ;
        xm(iter) = mean(x(leaders==0)) ;
        end
    speed = ols(xm, (1:niter)') ;
    end
