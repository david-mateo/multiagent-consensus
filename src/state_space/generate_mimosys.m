function sys = generate_mimosys(protocol, leaders)
    % Generate a MIMO state-space model sys from
    % a consensus protocol and a list of leaders.
    % The output are the agents themselves
    % (meaning C=identity and D=0)
    % Requires the control package.
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
    is_leader = false*ones(1,total_nodes) ;
    is_leader(leaders)=true ;
    is_agent = not(is_leader) ;
    nodes = 1:total_nodes ;
    agents = nodes(logical(is_agent)) ;
    

    A = protocol(agents,agents) ;
    B = protocol(agents,leaders) ;
    C = eye(length(agents)) ;
    D = zeros(size(B)) ; 
    sys = ss(A, B, C, D);
end
