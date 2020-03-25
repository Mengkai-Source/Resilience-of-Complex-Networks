function output_one_x = Perturpation_real_M(nnros,A,perturbation_type,M,K_c)
%   Perturpation_real_M assigns the calculation to different type of
%   perturbations
%
%   output_one = Perturpation_real_M(nnlros,A,perturbation_type,type_net,M)
%
%   Inputs:
%       nnros : number of links removal in one step
%       A : Adjacency matrix of the network
%       perturbation_type : type of perturbations
%       type_net : type_net = 1 for flower; 2 for bee
%       M : mutualistic bipartite networks
%
%   Outputs:
%       output_one : the output for one realization, which is 
%                    a m \times n matrix. m depends on nnros and number of
%                    links in the network, n = 6.
%
%
%   Format of outputs:
%
%   columns of output_one are
%	[Average low state,	Average high state,	x_eff of low state, 
%    x_eff of high state, beta_eff, fraction of reduction f] 
%   rows of output_one for mutulistic dynamic correspond to different f.
%
%   See also weight_changes, node_removal, link_removal. 

if perturbation_type == 1 % run node perturbation function
    output_one_x = link_removal_M(nnros,M,K_c);
else % run weight perturbation function
    output_one_x = weight_changes_M(A,P,K_c);  % Input A for ANIMAL (P for PLANTS)
end