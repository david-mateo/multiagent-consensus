function [A B C D] = generate_mimomatrices(protocol, leaders)
    % Generate the matrices corresponding to a
    % MIMO state-space model from a consensus
    % protocol and a list of leaders.
    % The input signal of the system comes
    % from the list of leaders. The output
    % signal is the vector of agents themselves.
    % (meaning C=identity and D=0)
    %
    % Inputs:
    %   protocol (NxN): lineal dynamical rule,
    %                   dx/dt = protocol * x
    %   leaders (1x:): list of the nodes that are leaders.
    total_nodes = length(protocol) ;
    is_leader = false*ones(1,total_nodes) ;
    is_leader(leaders)=true ;
    is_agent = not(is_leader) ;
    nodes = 1:total_nodes ;
    agents = nodes(logical(is_agent)) ;
    

    A = protocol(agents,agents) ;
    B = protocol(agents,leaders) ;
    C = eye(length(agents)) ;
    D = zeros(length(agents),length(leaders)) ; 
end
