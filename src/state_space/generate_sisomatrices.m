function [A B C D] = generate_sisomatrices(protocol, is_leader)
    % Generate the matrices corresponding to a
    % SISO state-space model from a consensus
    % protocol and a list of leaders.
    % The output (C and D) is set to zero and
    %
    % Inputs:
    %   protocol (NxN): lineal dynamical rule,
    %                   dx/dt = protocol * x
    %   is_leader (1xN): vector designating leaders.
    %   The entry must be 0 if the node is not a  
    %   leader and !=0 if it is. Leaders can have
    %   values !=1 to introduce a phase in the 
    %   input, e.g. [0 1 0 0 -1 0] for two leaders.
    total_nodes = length(protocol) ;
    is_agent = not(is_leader) ;
    nodes = 1:total_nodes ;
    agents = nodes(logical(is_agent)) ;
    sag = size(agents) ;

    A = protocol(agents,agents) ;
    B = protocol(agents,:)*is_leader' ;
    C = zeros(sag) ; 
    D =  0 ; 
end
