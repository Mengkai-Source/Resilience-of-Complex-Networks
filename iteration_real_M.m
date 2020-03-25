function output_one_x = iteration_real_M(steps,output_one_x,A,MM,K_c)
%   iteration_synthetic_M calculates the output for one step
%   of mutulistic dynamic on real networks
%
%% Simulation Process
ra = length(A); % number of nodes in the network
%---Parameters for iteration_synthetic_R-----------
t0 = 0; % the start time 
tf = 200; % the end time 
x_high = 5;
%% calculate the high state
if sum(sum(A)) == 0
    output_one_x(steps,1) = 0;
else
    x0 = ones(ra,1)*x_high; % x_high;  % Initial conditions
    X0 = x0;
    options = [];
    [t,X] = ode45(@M_system,[t0,tf],X0,options,A); 
    xh_ss = X(end,:);
    k_s = (sum(MM))'; 
    output_one_x(steps,1) = (sum(xh_ss*(k_s)))./(sum(k_s)); % Degree-based Weighted Outputs  % Decided
end
%% Dimension Reduced Model to calculate the HIGH state
Xeff0 = x_high;
Xeff = mean(Xeff0);
options = [];
[t,X] = ode45(@degreespace,[t0,tf],Xeff,options,MM); 
output_one_x(steps,2) = X(end);
%% Analytical Calculation
if MM==0
    Keff = 0;
else
    k_row=sum(MM,2); r_in=MM*k_row;
    k_col=sum(MM);
    K_degree = sum(k_col.*r_in')/sum(((k_row'*k_col')));
    Keff = K_degree;
end


alpha = 0.3; s = 0.4; h = 0.5;ts = 0.5;

k = Keff.^(1-ts);
if Keff >= K_c
   output_one_x(steps,3) = (alpha*h*k+s-k-((alpha*h*k+s-k).^2-4*alpha*s*h*k).^(1/2))/(-2*s*h*k);
else
   output_one_x(steps,3) = 0;
end

output_one_x(steps,4) = Keff;