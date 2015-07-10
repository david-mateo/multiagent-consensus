function w = cutoff(sys)
    % Compute cutoff frequency of a
    % linear state space model.
    % Cutoff frequency defined as the
    % frequency at which the gain is
    %  3dB lower than at w=0.
    %
    % Returns zero if the system
    % doesn't have cutoff frequency.
    [nouts nins] = size(sys.d) ;
    w=zeros(nouts,nins) ;
    for in=1:nins
        for out=1:nouts
            [mag pha freqs] = bode(sys(out,in)) ;
            gain = mag2db(mag) - mag2db(mag(1)) ;
            try
                w(out,in) = freqs(gain<-3)(1) ;
            catch
                fprintf(stderr,'cutoff.m: No cutoff found, returning zero instead\n') ;
                w(out,in) = 0. ;
        end
    end
end

