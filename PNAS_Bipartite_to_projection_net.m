function A = PNAS_Bipartite_to_projection_net(M) % Generate data based on Equation [2]
%   Bipartite_to_projection_net returns the projection networks from
%   mutualistic bipartitie network
%
%   Bipartite_to_projection_net(M)
%
%   Inputs:
%       M : mutualistic bipartitie network
%
%   Outputs:
%       file_name : save a .mat file including all the network data
%       A : the projection animal (pollinator) network
%       P : the projection plant network
%       M : mutualistic bipartitie network (Row: animal; Column: plant)
%       ts : Strength of the tradeoff (Equation [2])
%
%   See also remove_one_effect_the_other
r0 = 1; % Equation [2]
ts = 0.5; % Tradeoff between the interaction strength and the number of interaction
[m,n] = size(M);
%% According to Eq. [2] to calculate the A (m*n) matrix
A = zeros(m,n);  % Calculate Animal - Plant rij in equation [2], i denotes animal, j denotes plant;
k = sum(M,2);   % a vector denotes the number of animal each plant visits

for j = 1:m
    for i = 1:n
        if M(j,i) ~= 0
           A(j,i) = r0/(k(j)^ts);
        end
     end
end
