function [normalize_PE_force] = force_length_parallel(lm)
    %%%% TAKS 1
    
    % Input Parameters
    % lm: normalized length of muscle (contractile element)
    
    % Output
    % normalized force produced by parallel elastic element
    
    % WRITE YOUR CODE HERE
    lpes = 1;
    normalize_PE_force = zeros(size(lm)); % This preallocates the space for speed
    
    for i = 1:size(lm,2)
        if i < 100
            normalize_PE_force(i) = 0;
        else
            normalize_PE_force(i) = (3*((lm(i)-lpes)^2))/(0.6+lm(i)-lpes);
        end
    end
    
    % To Do -------------------------
    % See if you can get the piecewise to work in the same manner
    % And also to make it so that it is not hard coded to 100 (100 is basically
    %%% the value in the array where normalized tendon length is 1 (see
    %%% plot_curves file)
    
    % Your existing code
    %normalize_PE_force = piecewise(lm < lpes, 0, lm >= lpes, (3*((lm-lpes).^2))./(0.6+lm-lpes));