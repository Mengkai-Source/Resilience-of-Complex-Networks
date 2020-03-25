function FM = M_system(t,x,A)
%   M_system describes the mutualistic dynamic
%
%   Fv = M_system(t,x,y,A)
%
%   Inputs:
%       t : The time
%       x : The state vector of all animal nodes
%       y:  The state vector of all plant nodes
%       X: (x+y row, 1 column)
%       A : Adjacency matrix of the network    Animal - Plant
%       P : Adjacency matrix of the network    Plant  - Animal
%   Outputs:
%       FM : the derivative of state x (x+y row, 1 column)

% Copyright: Mengkai Xu
%---Parameters for mutualistic dynamics-----------
alpha = 0.3; s = 0.4; h = 0.5; 
%% ---Parameters for competition dynamics-----------
%% ------- Species Growth rate -------


FM = - alpha.*x - s.*x.^2;    

f_in = A*x;
FM = FM + x.*f_in./(1+h*f_in);
