%%
function [policy_matrix] = sirpolicy(current_policy, slird_vals)

% this function returns a new policy (for the next time step) based on the current policy and current SLIRD values
% slird_vals: a 5 dimensional vector containing the current proportion of individuals in susceptible, lockdown, infected, recovered and deceased
% current_polc: a 5x5 matrix containing the current SLIRD policy (i.e., the state transition matrix)

benefit = 10*(norm(slird_vals(:,3)))+10*(norm(slird_vals(:,5)));
%Baseline model infection rate: 0.015
%Baseline model fatality rate: 0.01
y = (slird_vals(:, 3)/.015)/100;
b = (slird_vals(:,5)/.01)/100;
cost = (100*norm(slird_vals(:,2)^2) + 800*(1-y)*(slird_vals(:,3)^2) + 800*(1-b)*(slird_vals(:,5)^2))/100;

wobble = mean(std(current_policy));
alpha_ = 1;

j_relative = benefit - (alpha_ * cost) - wobble; 

assignin('base', 'benefit', benefit);
%set up the current policy matrix
new_policy = [ 1 0   0    0 0;
               0 .95 0    0 0;
               0 .05 1    0 0;
               0 0   0    1 0;
               0 0   0    0 1];


final_policy = current_policy * new_policy;
              
policy_matrix = final_policy;

end