addpath('../src/graph_generation/')
addpath('../src/linear_consensus/')
addpath('../src/state_space/')
% if not installed, type "pkg install -forge control"
pkg load control ;

totnodes = 50 ;
k  = 2;
g = regularmesh_1dperiodic_graph(totnodes, k) ; 
g = regularize_graph(g) ;


% Two independent inputs
leaders=[1 20] ;
sys = generate_mimosys(g, leaders) ;
cutoffs = cutoff_sys(sys) ;
mean_cutoff = mean(cutoffs(:)) ;
fprintf('Mean cutoff frequency:\t%f\n', mean_cutoff)

% Two leaders sharing one input
is_leader = zeros(1,totnodes) ;
is_leader(1) = 1 ;
is_leader(20) = 1 ;
sys = generate_sisosys(g, is_leader) ;
nagents = totnodes - sum(is_leader!=0) ;
cutoffs = zeros(1,nagents) ;
for i=1:nagents
    C = zeros(1,nagents) ;
    C(1,i) = 1 ;
    sys.c = C ;
    cutoffs(i) = cutoff_sys(sys) ;
end
mean_cutoff = mean(cutoffs(:)) ;
fprintf('Mean cutoff frequency:\t%f\n', mean_cutoff)
