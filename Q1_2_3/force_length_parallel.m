function [normalize_tendon_tension] = force_length_tendon(lt)
    %%%% TAKS 1
    
    % Input Parameters
    % lt: normalized length of tendon (series elastic element)
    
    % Output
    % normalized tension produced by tendon
    
    % WRITE YOUR CODE HERE
    lts = 1;
    normalize_tendon_tension = zeros(size(lt)); % This preallocates the space for speed
    
    for i = 1:size(lt,2)
        if i < 100
            normalize_tendon_tension(i) = 0;
        else
            normalize_tendon_tension(i) = 10*(lt(i)-lts)+240*((lt(i)-lts)^2);
        end
    end
    
    % To Do -------------------------
    % See if you can get the piecewise to work in the same manner
    % And also to make it so that it is not hard coded to 100 (100 is basically
    %%% the value in the array where normalized tendon length is 1 (see
    %%% plot_curves file)
    
    % Your existing code
    % normalize_tendon_tension = piecewise(lt < lts, 0, lt >= lts, 10*(lt-lts)+240*((lt-lts).^2));