function sys = generate_sys(protocol, leaders)
    % Generate a SISO state-space model sys from
    % a consensus protocol and a list of leaders.
    % The output (C and D) is set to zero and
    % it can be dyanmically changed by
    %   sys.c = [...]
    %   sys.d = [...]
    %
    % Requires the control package.
    total_nodes = length(protocol) ;
    is_agent = ones(1,total_nodes) ;
    is_agent(leaders)=0 ;
    agents = (1:total_nodes)(logical(is_agent)) ;
    sag = size(agents) ;

    A = protocol(agents,agents) ;
    B = sum( protocol(agents,leaders) , 2) ;
    C = zeros(sag) ; 
    D =  0 ; 
    sys = ss(A, B, C, D);
end
