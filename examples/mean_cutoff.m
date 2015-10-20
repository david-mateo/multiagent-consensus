addpath('../src/graph_generation/')
addpath('../src/linear_consensus/')
addpath('../src/state_space/')

totnodes = 51 ;
for k=2:2:50
    g = regularmesh_1dperiodic_graph(totnodes, k/2) ; 
    g = regularize_graph(g) ;

    leaders=[1] ;
    [A B C D] = generate_mimomatrices(g, leaders) ;
    cutoffs = cutoff(A,B,C,D) ;
    mean_cutoff = mean(cutoffs(:)) ;
    printf('%i\t%e\n', k,mean_cutoff)
end
