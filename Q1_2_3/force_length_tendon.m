function [normalize_tendon_tension] = force_length_tendon(lt)
%%%% TAKS 1

% Input Parameters
% lt: normalized length of tendon (series elastic element)

% Output
% normalized tension produced by tendon

% WRITE YOUR CODE HERE

lts = 1;
normalize_tendon_tension = pw(lt < lts, 0, lt >= lts, 10*(lt-lts)+240*((lt-lts).^2));


end