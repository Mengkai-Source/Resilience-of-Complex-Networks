print -painters -depsc Integrated.eps


% save the plot as eps
print -painters -dsvg Insights.svg  % save the plot as svg
%% Curve Plot -- Reduce Model
%subplot(3,3,1)
figure
PNAS_Node_rem = outputx(:,:,1);
[r c] = size(outputx(:,:,1));
number_node = ones(r,c);
Number_node = number_node - outputx(:,:,5); %outputy(:,:,3); 
[r c] = size(outputx(:,:,1));
%figure
for i=1:r
    plot(Number_node(i,:),PNAS_Node_rem(i,:),'Color',[150/255 150/255 100/255])    
    hold on;
end

alpha = 0.3; s = 0.4; h = 0.8;ts = 0.5;
Keff=0:0.01:50;
k = Keff.^(1-ts);
output=[];
for i=1:length(k)
    if Keff(i) >= K_c
        output(i) = (alpha*h*k(i)+s-k(i)-((alpha*h*k(i)+s-k(i)).^2-4*alpha*s*h*k(i)).^(1/2))/(-2*s*h*k(i));
    else
        output(i) = 0;
    end
end
plot(Keff,output);hold on;

%Plot the Degree
PNAS_Node_rem = outputx(:,:,1);
[r c] = size(outputx(:,:,1));
Number_node = outputx(:,:,4);
for i=1:r
    plot(Number_node(i,:),PNAS_Node_rem(i,:),'.','MarkerEdgeColor',[40/255 40/255 160/255])
    hold on;
end

%% Plot Features
i=15;
plot3(0.4896,2.6937,7.5993,'s','MarkerSize',12,'MarkerEdgeColor',[40/255 40/255 160/255],'MarkerFaceColor',[40/255 40/255 160/255]);
hold on;


%% Interval Plot -- Node Removal -- Reduce Model outputx
Node_rem = outputx(:,:,1);
[r c] = size(outputx(:,:,1));
number_node = ones(r,c);
Number_node = number_node - outputx(:,:,5);
[r c] = size(outputx(:,:,1));
Mean=mean(Node_rem);
hold on
plot(Number_node(1,:),Mean,'Color',[102/255 220/255 243/255])

PNAS_Node_rem = outputx(:,:,3);
[r c] = size(outputx(:,:,3));
number_node = ones(r,c);
Number_node = number_node - outputx(:,:,5);
[r c] = size(outputx(:,:,3));
Mean=mean(PNAS_Node_rem);
hold on
plot(Number_node(1,:),Mean,'Color','k')

print -painters -dsvg Dir_SF_FeatureAs_Undir.svg

for i=1:c
    NODE = Number_node(:,i);
    REM = PNAS_Node_rem(:,i);
    %plot(Number_node(:,i),PNAS_Node_rem(:,i),'r');hold on;
    plot(Number_node(:,i),mean(PNAS_Node_rem(:,i)),'g*','MarkerSize',12);
    %plot(min(NODE),min(REM),'r.','MarkerSize',12);hold on;
    %plot(max(NODE),max(REM),'r.','MarkerSize',12);
end
hold on
plot(Number_node,Mean,'r')
%xlim([0 1]);ylim([0 1]);
hold on;
%% Interval Plot -- Node Removal --  Reduce Model outputy
subplot(2,3,5)
PNAS_Node_rem = outputy(:,:,1);
[r c] = size(outputy(:,:,1));
number_node = ones(r,c);
Number_node = number_node - outputy(:,:,3);
[r c] = size(outputy(:,:,1));
Mean=mean(PNAS_Node_rem);
for i=1:c
    NODE = Number_node(:,i);
    REM = PNAS_Node_rem(:,i);
    plot(Number_node(:,i),PNAS_Node_rem(:,i),'r');hold on;
    plot(Number_node(:,i),mean(PNAS_Node_rem(:,i)),'r*','MarkerSize',12);
    plot(min(NODE),min(REM),'r.','MarkerSize',12);hold on;
    plot(max(NODE),max(REM),'r.','MarkerSize',12);
end
plot(Number_node,Mean,'r')
%xlim([0 1]);ylim([0 1]);
%% Interval Plot -- Shade Plot OutputX
subplot(3,3,9)
PNAS_Node_rem = outputx(:,:,1);
[r c] = size(outputx(:,:,1));
number_node = ones(r,c);
Number_node =  number_node - outputx(:,:,5); %outputx(:,:,3);
[r c] = size(outputx(:,:,1));
Mean=mean(PNAS_Node_rem);
Max_bon=zeros(1,c);
Min_bon=zeros(1,c);
for i=1:c
    NODE = Number_node(:,i);
    REM = PNAS_Node_rem(:,i);
    Max_bon(i) = max(REM);
    Min_bon(i) = min(REM);
    %plot(Number_node(:,i),PNAS_Node_rem(:,i),'r');hold on;
    %plot(Number_node(:,i),mean(PNAS_Node_rem(:,i)),'g*','MarkerSize',10);
    %plot(min(NODE),min(REM),'ro','MarkerSize',10);hold on;
    %plot(max(NODE),max(REM),'ro','MarkerSize',10);
end
inBetween=[Max_bon, fliplr(Min_bon)]; 
x2=[Number_node(1,:), fliplr(Number_node(1,:))];
fill(x2,inBetween,[0.85 0.325 0.098])
alpha(0.3)
hold on;
plot(Number_node,Mean,'r','MarkerSize',12,'LineWidth',2)
plot(Number_node,Mean,'ro','MarkerSize',12,'LineWidth',2)
%xlim([0 1]);ylim([0 1]);
%% 3D Plot
subplot(3,3,3)
PNAS_Node_rem = outputx(:,:,2);
[r c] = size(outputx(:,:,2));
number_node = ones(r,c);
Number_node = number_node - outputx(:,:,3); %outputy(:,:,3); 
[r c] = size(outputy(:,:,2));
alpha=1.3*ones(1,c);
%figure
for i=1:r
    plot3(alpha,Number_node(i,:),PNAS_Node_rem(i,:),'k')
    hold on;
end

