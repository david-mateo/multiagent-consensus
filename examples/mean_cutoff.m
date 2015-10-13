addpath('../src/graph_generation/')
addpath('../src/linear_consensus/')
addpath('../src/state_space/')

totnodes = 50 ;
k  = 2;
g = regularmesh_1dperiodic_graph(totnodes, k) ; 
g = regularize_graph(g) ;


% Two independent inputs
leaders=[1 20] ;
[A B C D] = generate_mimomatrices(g, leaders) ;
cutoffs = cutoff(A,B,C,D) ;
mean_cutoff = mean(cutoffs(:)) ;
fprintf('Mean cutoff frequency:\t%f\n', mean_cutoff)

% Two leaders sharing one input
is_leader = zeros(1,totnodes) ;
is_leader(1) = 1 ;
is_leader(20) = 1 ;
[A B C D] = generate_sisomatrices(g, is_leader) ;
nagents = totnodes - sum(is_leader!=0) ;
cutoffs = zeros(1,nagents) ;
for i=1:nagents
    C = zeros(1,nagents) ;
    C(1,i) = 1 ;
    cutoffs(i) = cutoff(A,B,C,D) ; 
end
mean_cutoff = mean(cutoffs(:)) ;
fprintf('Mean cutoff frequency:\t%f\n', mean_cutoff)
