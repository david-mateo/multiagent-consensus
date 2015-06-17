addpath('../src/graph_generation/')
addpath('../src/linear_consensus/')
addpath('../src/state_space/')
% if not installed, type "pkg install -forge control"
pkg load control ;

totnodes = 50 ;
k  = 2;
leaders = [ 1 5 ] ;
nleaders = length(leaders) ;
nagents = totnodes-nleaders ;
g = regularmesh_1dperiodic_graph(totnodes, k) ; 
g = regularize_graph(g) ;

sys = generate_sys(g, leaders) ;

cutoffs = zeros(1,nagents) ;
for i=1:nagents
    C = zeros(1,nagents) ;
    C(1,i) = 1 ;
    sys.c = C ;
    cutoffs(i) = cutoff(sys) ; 
end

cutoff = mean(cutoffs) ;
fprintf('Mean cutoff frequency:\t%f\n', cutoff)
