function simulate(T, f0M, resting_length_muscle, resting_length_tendon, RelTol, AbsTol)

% Input Parameters
% T: simulation time (seconds)
% f0M: maximum isometric force
% resting_length_muscle: actual length (m) of muscle (CE) that corresponds to normalized length of 1
% resting_length_tendon: actual length of tendon (m) that corresponds to normalized length of 1

%%% TASK 1
hill_muscle = HillTypeMuscle(f0M, resting_length_muscle, resting_length_tendon);

%%% TASK 2
mt_length = resting_length_muscle + resting_length_tendon;
function [velocity] = velocity_of_muscle(time, n_muscle_length)
    a = 0;
    if T < 0.5
        a = 0;
    else
        a = 1;
    end

    norm_t_length = norm_tendon_length(hill_muscle, mt_length, n_muscle_length)
    velocity = velocity_of_muscle(a, , norm_t_length, n_muscle_length)
end

%%% TASK 3
% the outputs of ode45 must be named "time" and "norm_lm"
[time, norm_lm] = ode45(@velocity_of_muscle, [0 2], 1)

%%% TASK 4
% save the estimated forces in a vector called "forces"
force = get_force(hill_muscle, mt_length, norm_lm)

% Do not alter the rest (it should not be needed)
norm_lm = norm_lm * resting_length_muscle;

% Plot results
figure()
LineWidth = 1.5;
FontSize = 12;

subplot(2,1,1)
plot(time, norm_lm, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('Normalized CE Length (m)')
set(gca,'FontSize', FontSize)

subplot(2,1,2)
plot(time, forces, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('CE Tension (N)')
set(gca,'FontSize', FontSize)
end