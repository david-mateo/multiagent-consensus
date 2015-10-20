function w = cutoff(A,B,C,D)
    % Compute cutoff frequency of a
    % linear state space model defined as:
    %       dx/dt = A*x + B*u
    %       y     = C*x + D*u
    % The cutoff frequency is defined as
    % the frequency at which the gain is 1/2
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
    
    onei = i*eye(size(A)) ;
    [nouts nins] = size(D) ;
    A2 = A*A ;
    A3 = A2*A ;
    w = zeros(nouts,nins) ;
    for out=1:nouts
        sC = C(out,:) ;
        for in=1:nins
            sB = B(:,in) ;
            sD = D(out,in) ;
            gain0 = abs( (sC / A)*sB + sD )^2 ; % transfer function at w=0
            target_gain = gain0/2 ;
            
            % Cutoff frequency estimated through Taylor expansion to feed fzero:
            w0 = sqrt(0.5*gain0 / (2.*(sC/A*sB+sD)*(sC/A3*sB)-(sC/A2*sB)^2) ) ;
            % objective function = Gamma(w) - 0.5*Gamma(0)
            objective = @(w) ( abs( (sC /(w*onei-A) )*sB + sD)^2 - target_gain );
            w(out,in) = abs( fzero(objective, w0) ) ;
        end
    end
end
