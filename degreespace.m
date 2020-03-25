 function FN = degreespace(t,X,M)
%   Inputs:  
%       x : The state vector of all animal nodes
%       M : Adjacency matrix of the network  
%   Outputs:
%       x_eff : x_eff of all species
% Copyright: Mengkai Xu
%
%r0 = 1; % Equation [2]
FN = ones(1,1);
x_eff = X;
alpha = 0.3; s = 0.4; h = 0.5; ts = 0.5;
%% Caculate effective abundance of Animal and Plant
if M==0
    Keff = 0;
else
    k_row=sum(M,2); r_in=M*k_row;
    k_col=sum(M);
    K_degree = sum(k_col.*r_in')/sum(((k_row'*k_col')));
    Keff = K_degree.^(1-ts);
end
%% Caculate mutualistic 
FN = -alpha*x_eff - s*x_eff.^2  +  Keff*(x_eff.^2)/(1 + h*Keff* x_eff);
