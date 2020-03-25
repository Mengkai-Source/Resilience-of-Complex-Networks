function Main_real_M
%   This is the main function to run mutualistic dynamics on real networks.
%
%
%   Inputs:
%       load networks : load the real networks in folder all_real_data.
%       type_net : the type of networks, 1 for flower, 2 for bee.
%       nnlros : number of nodes or links removal in one step. Defaut value
%       1.
%       perturbation_type : type of perturbations: 1 for node removal,
%       num_reali: number of realizations
%
%
%   Outputs:
%       save_file_name : a .mat file contenting all the simulation results
%       outputs : the outputs of all realizations, which is 
%                    a Z \times M \times N matrix. Z = num_reali,
%                    M is equal to the length of fraction_reduce,
%                    N = 6 for mutualistic dynamic,
%
clear;
clc;
alpha = 0.3; s = 0.4; h = 0.8;ts = 0.5; %alpha = 0.3,h = 0.8
K_c = (((alpha*h).^0.5-1).^2./s).^(1./(ts-1));

A = PNAS_Bipartite_to_projection_net(M);
A = sparse(A); 
cluster = find_gaint_component(A); 
A = A(cluster,cluster); 
nnros = 200;
num_reali = 20;  % num_reali: number of realizations
for realization = 1:num_reali 
    perturbation_type = 1;
    output_one_x = Perturpation_real_M(nnros,A,perturbation_type,M,K_c);
    [nnx,mmx] = size(output_one_x); 
    outputx(realization,1:nnx,1:mmx) = output_one_x;
    save Results  outputx
end