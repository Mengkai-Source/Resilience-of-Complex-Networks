function [A,MM] = remove_one_effect_the_other(M,remove) % Remove ANIMAL/Plant from the network
%   remove_one_effect_the_other returns a projection network 
%   from a bipartite network by removing nodes from another 
%   projection network. 
%   A = remove_one_effect_the_other(M,type_net,remove)
%
%   Inputs:
%       M : the bipartite mutualistic network
%       type_net : type_net = 1 for flower, 2 for bee
%       remove : the set of nodes removed from the other type of network.
%
%   Outputs:
%       A : the adjacency matrix of the network after perturbations
%
%   See also link_removal_M. 
r0 = 1; ts = 0.5;
% ---------- Remove PLANT from the network -----------

M(remove,:) = [];
M(:,remove) = [];
[m,n] = size(M);
A = zeros(m,n);
k = sum(M,2);
for g = 1:m
    for j = 1:n
        if M(g,j) ~= 0
           A(g,j) = r0/(k(g).^ts);
        end
    end
end

cluster = find_gaint_component(A);
A = A(cluster,cluster);
MM = M(cluster,cluster);