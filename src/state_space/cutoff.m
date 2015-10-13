function w = cutoff(A,B,C,D)
    % Compute cutoff frequency of a
    % linear state space model defined as:
    %       dx/dt = A*x + B*u
    %       y     = C*x + D*u
    % The cutoff frequency is defined as
    % the frequency at which the gain is 1/sqrt(2)
    % times smaller than the gain at w=0.
    %
    % Inputs:
    %       A (N x N): system matrix.
    %       B (N x ins): input matrix.
    %       C (outs x N): output matrix.
    %       D (outs x ins): feedforward matrix.
    % 
    % Return a matrix of dimension (outs x ins) where
    % w(i,j) is the cutoff frequency of output i to input j.
    
    one = eye(size(A)) ;
    [nouts nins] = size(D) ;
    w = zeros(nouts,nins) ;
    for out=1:nouts
        sC = C(out,:) ;
        for in=1:nins
            sB = B(:,in) ;
            sD = D(out,in) ;
            gain0 = -(sC / A)*sB + sD ; % transfer function at w=0
            %if (gain0!=1.0)
            %    printf('multiagent-consensus.cutoff: Gain at w=0 is %f\n', gain0) ;
            %end
            target_gain = gain0*sqrt(0.5) ;
            
            % objective function = Gamma(w) - (1/sqrt(2))Gamma(0)
            objective = @(w) ( sC /(w*one-A) )*sB + sD - target_gain ;
            w(out,in) = fzero(objective, 0.0) ;
        end
    end
end
