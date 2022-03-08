function [normalize_PE_force] = force_length_parallel(lm)
%%%% TAKS 1

% Input Parameters
% lm: normalized length of muscle (contractile element)

% Output
% normalized force produced by parallel elastic element

% WRITE YOUR CODE HERE

lpes = 1;
normalize_PE_force = pw(lm < lpes, 0, lm >= lpes, (3*((lm-lpes).^2))/(0.6+lm-lpes));


end