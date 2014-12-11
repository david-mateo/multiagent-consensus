function threshold_mean_polarization(nag, nleads, kmax , runs, threshold)
    addpath('../src/graph_generation/')
    addpath('../src/threshold_consensus/')

    ks = 01:01:kmax ;
    fprintf('# Voter consensus\n# Num agents        %i\n# Num leaders       %i\n# Runs              %i\n',nag, nleads, runs) ;
    for k=ks
        x = zeros(runs,1) ;
        for r=1:runs
            % Define small world network
            g = small_world_graph(nag, k) ;
            g = regularize_graph(g) ;
            xp = polarization_threshold( nag, nleads, g, threshold) ;
            x(r) = xp ;
            end
        fprintf('%i\t%f\t%f\n',k,mean(x),std(x) ) ;
        end
    end

function xm = polarization_threshold( nag, nleads, graph, th)
    % Choose random leaders
    leaders = zeros(1,nag) ;
    leaders(randperm(nag)(1:nleads)) = ones(1,nleads) ;
    % Initial state
    x =zeros(1,nag) ;
    x(leaders==1) = ones(1,nleads) ;

    niter=500 ;
    for iter=1:niter
        xold = x ;
        x = update_leader(graph, x, th, leaders) ;
        if(x==xold) 
            break
            end
        end
    if (iter==niter)
        fprintf(stderr(),'No equilibrium reached for k = %i and nleads = %i\n',k,nleads ) ;
        end
    xm =mean(x(leaders==0)) ; 
    end

