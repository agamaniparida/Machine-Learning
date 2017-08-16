
%--------------- Initializing the dataset of flowers ---------------------%
Y=dlmread('simple_iris_dataset.dat');
X=Y(:,[1 2]);      
Dim=size(X);
      
%----------------------- Selecting 2 random centres ----------------------% 
Selection=rand(1,2);
Selection=Selection*Dim(1,1);
Selection=ceil(Selection); %Selecting the row number.

%--------------------------- 2 random centres ----------------------------%
Centre1=X(Selection(1),:);
Centre2=X(Selection(2),:);


[N,n]=size(Y);
old_label = zeros(1,N);
label = ones(1,N);

it = 0;
while ~isequal(old_label, label)
    
    
    it = it + 1;


%----------------------- Partitional Algorithm ---------------------------%
%-------------------------- K means Algorithm ----------------------------%

count1=0;
Mean1=zeros(1,2);
count2=0;
group1=[];
Mean2=zeros(1,2);
group2=[];


%Finding the minimum distance
for i=1:1:Dim(1,1)
    
dist1(i)=sqrt((Centre1(1,1)-X(i,1))^2+(Centre1(1,2)-X(i,2))^2);
dist2(i)=sqrt((Centre2(1,1)-X(i,1))^2+(Centre2(1,2)-X(i,2))^2);


LessDist=[dist1(i) dist2(i)];
Minimum=min(LessDist);


%Finding the new centre
if (Minimum==dist1(i))
    count1=count1+1;
    Mean1=Mean1+X(i,:);
    group1=[group1 i];
    pr(i)=1;
else (Minimum==dist2(i));
        count2=count2+1;
        Mean2=Mean2+X(i,:);
        group2=[group2 i];
        pr(i)=2;
    
end

end

%----------------------------- New Centres -------------------------------%
Centre1=Mean1/count1;
Centre2=Mean2/count2;




old_label = label;
label = pr;
end





figure; 
hold on; 
xlabel('Sepal Length'); 
ylabel('Sepal Width'); 
plot(X(group1,1),X(group1,2),'r.','MarkerSize',10)
plot(X(group2,1),X(group2,2),'b.','MarkerSize',10)
plot(Centre1(:,1),Centre1(:,2),'kx', 'MarkerSize',12,'LineWidth',2);
plot(Centre2(:,1),Centre2(:,2),'ko', 'MarkerSize',12,'LineWidth',2);
hold off


count1;
count2;


group1;
group2;

Confusion_Matrix=confusionmat(Y(:,3),pr)
fprintf('No of Iteration required for Convergence%3i\n',it)






    
