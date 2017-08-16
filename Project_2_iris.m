M=dlmread('iris_dataset.dat');
N=M(randperm(150),:);
P=N(16:150,:);
Q=N(1:15,:);
P=sortrows(P,[5,1,2,3,4]);
x=P(1:44,[1,2,3,4]);
y=P(45:90,[1,2,3,4]);
z=P(91:135,[1,2,3,4]);
mu1=mean(x)';
mu2=mean(y)';
mu3=mean(z)';
sigma1=((x'-mu1)*(x'-mu1)')/44;
sigma2=((y'-mu2)*(y'-mu2)')/46;
sigma3=((z'-mu3)*(z'-mu3)')/45;
g1=logmvnpdf(Q(:,[1,2,3,4]),mu1,sigma1)';
g2=logmvnpdf(Q(:,[1,2,3,4]),mu2,sigma2)';
g3=logmvnpdf(Q(:,[1,2,3,4]),mu3,sigma3)';
for i=1:15
    if(g1(i)>g2(i)&&g1(i)>g3(i))
        
        pr(i)=1;
    end
    if(g2(i)>g1(i)&&g2(i)>g3(i))
        
        pr(i)=2;
    end
    if(g3(i)>g2(i)&&g3(i)>g1(i))
        
        pr(i)=3;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P1=N([1:15,31:150],:);
Q1=N(16:30,:);
P1=sortrows(P1,[5,1,2,3,4]);
x1=P1(1:46,[1,2,3,4]);
y1=P1(47:92,[1,2,3,4]);
z1=P1(93:135,[1,2,3,4]);
mu4=mean(x1)';
mu5=mean(y1)';
mu6=mean(z1)';
sigma4=((x1'-mu4)*(x1'-mu4)')/47;
sigma5=((y1'-mu5)*(y1'-mu5)')/46;
sigma6=((z1'-mu6)*(z1'-mu6)')/42;
g4=logmvnpdf(Q1(:,[1,2,3,4]),mu4,sigma4)';
g5=logmvnpdf(Q1(:,[1,2,3,4]),mu5,sigma5)';
g6=logmvnpdf(Q1(:,[1,2,3,4]),mu6,sigma6)';
for i=1:15
    if(g4(i)>g5(i)&&g4(i)>g6(i))
        
        pr1(i)=1;
    end
    if(g5(i)>g4(i)&&g5(i)>g6(i))
        
        pr1(i)=2;
    end
    if(g6(i)>g4(i)&&g6(i)>g5(i))
        
        pr1(i)=3;
    end
end  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P2=N([1:30,46:150],:);
Q2=N(31:45,:);
P2=sortrows(P2,[5,1,2,3,4]);
x2=P2(1:46,[1,2,3,4]);
y2=P2(47:90,[1,2,3,4]);
z2=P2(91:135,[1,2,3,4]);
mu7=mean(x2)';
mu8=mean(y2)';
mu9=mean(z2)';
sigma7=((x2'-mu7)*(x2'-mu7)')/46;
sigma8=((y2'-mu8)*(y2'-mu8)')/44;
sigma9=((z2'-mu9)*(z2'-mu9)')/45;
g7=logmvnpdf(Q2(:,[1,2,3,4]),mu7,sigma7)';
g8=logmvnpdf(Q2(:,[1,2,3,4]),mu8,sigma8)';
g9=logmvnpdf(Q2(:,[1,2,3,4]),mu9,sigma9)';
for i=1:15
    if(g7(i)>g8(i)&&g7(i)>g9(i))
        
        pr2(i)=1;
    end
    if(g8(i)>g7(i)&&g8(i)>g9(i))
        
        pr2(i)=2;
    end
    if(g9(i)>g7(i)&&g9(i)>g8(i))
        
        pr2(i)=3;
    end
end  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P3=N([1:45,61:150],:);
Q3=N(46:60,:);
P3=sortrows(P3,[5,1,2,3,4]);
x3=P3(1:44,[1,2,3,4]);
y3=P3(45:91,[1,2,3,4]);
z3=P3(92:135,[1,2,3,4]);
mu10=mean(x3)';
mu11=mean(y3)';
mu12=mean(z3)';
sigma10=((x3'-mu10)*(x3'-mu10)')/44;
sigma11=((y3'-mu11)*(y3'-mu11)')/47;
sigma12=((z3'-mu12)*(z3'-mu12)')/44;
g10=logmvnpdf(Q3(:,[1,2,3,4]),mu10,sigma10)';
g11=logmvnpdf(Q3(:,[1,2,3,4]),mu11,sigma11)';
g12=logmvnpdf(Q3(:,[1,2,3,4]),mu12,sigma12)';
for i=1:15
    if(g10(i)>g11(i)&&g10(i)>g12(i))
        
        pr3(i)=1;
    end
    if(g11(i)>g10(i)&&g11(i)>g12(i))
        
        pr3(i)=2;
    end
    if(g12(i)>g10(i)&&g12(i)>g11(i))
        
        pr3(i)=3;
    end
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P4=N([1:60,76:150],:);
Q4=N(61:75,:);
P4=sortrows(P4,[5,1,2,3,4]);
x4=P4(1:46,[1,2,3,4]);
y4=P4(47:90,[1,2,3,4]);
z4=P4(91:135,[1,2,3,4]);
mu13=mean(x4)';
mu14=mean(y4)';
mu15=mean(z4)';
sigma13=((x4'-mu13)*(x4'-mu13)')/46;
sigma14=((y4'-mu14)*(y4'-mu14)')/44;
sigma15=((z4'-mu15)*(z4'-mu15)')/45;
g13=logmvnpdf(Q4(:,[1,2,3,4]),mu13,sigma13)';
g14=logmvnpdf(Q4(:,[1,2,3,4]),mu14,sigma14)';
g15=logmvnpdf(Q4(:,[1,2,3,4]),mu15,sigma15)';
for i=1:15
    if(g13(i)>g14(i)&&g13(i)>g15(i))
        
        pr4(i)=1;
       
    end
    if(g14(i)>g13(i)&&g14(i)>g15(i))
        
        pr4(i)=2;
        
    end
    if(g15(i)>g13(i)&&g15(i)>g14(i))
        
        pr4(i)=3;
    end
    
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P5=N([1:75,91:150],:);
Q5=N(76:90,:);
P5=sortrows(P5,[5,1,2,3,4]);
x5=P5(1:44,[1,2,3,4]);
y5=P5(45:89,[1,2,3,4]);
z5=P5(90:135,[1,2,3,4]);
mu16=mean(x5)';
mu17=mean(y5)';
mu18=mean(z5)';
sigma16=((x5'-mu16)*(x5'-mu16)')/44;
sigma17=((y5'-mu17)*(y5'-mu17)')/45;
sigma18=((z5'-mu18)*(z5'-mu18)')/46;
g16=logmvnpdf(Q5(:,[1,2,3,4]),mu16,sigma16)';
g17=logmvnpdf(Q5(:,[1,2,3,4]),mu17,sigma17)';
g18=logmvnpdf(Q5(:,[1,2,3,4]),mu18,sigma18)';
for i=1:15
    if(g16(i)>g17(i)&&g16(i)>g18(i))
        
        pr5(i)=1;
       
    end
    if(g17(i)>g16(i)&&g17(i)>g18(i))
       
        pr5(i)=2;
        
    end
    if(g18(i)>g16(i)&&g18(i)>g17(i))
        
        pr5(i)=3;
    end
    
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P6=N([1:90,106:150],:);
Q6=N(91:105,:);
P6=sortrows(P6,[5,1,2,3,4]);
x6=P6(1:43,[1,2,3,4]);
y6=P6(44:89,[1,2,3,4]);
z6=P6(90:135,[1,2,3,4]);
mu19=mean(x6)';
mu20=mean(y6)';
mu21=mean(z6)';
sigma19=((x6'-mu19)*(x6'-mu19)')/43;
sigma20=((y6'-mu20)*(y6'-mu20)')/46;
sigma21=((z6'-mu21)*(z6'-mu21)')/46;
g19=logmvnpdf(Q6(:,[1,2,3,4]),mu19,sigma19)';
g20=logmvnpdf(Q6(:,[1,2,3,4]),mu20,sigma20)';
g21=logmvnpdf(Q6(:,[1,2,3,4]),mu21,sigma21)';
for i=1:15
    if(g19(i)>g20(i)&&g19(i)>g21(i))
        
        pr6(i)=1;
       
    end
    if(g20(i)>g19(i)&&g20(i)>g21(i))
        
        pr6(i)=2;
        
    end
    if(g21(i)>g19(i)&&g21(i)>g20(i))
        
        pr6(i)=3;
    end
    
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P7=N([1:105,121:150],:);
Q7=N(106:120,:);
P7=sortrows(P7,[5,1,2,3,4]);
x7=P7(1:44,[1,2,3,4]);
y7=P7(45:89,[1,2,3,4]);
z7=P7(90:135,[1,2,3,4]);
mu22=mean(x7)';
mu23=mean(y7)';
mu24=mean(z7)';
sigma22=((x7'-mu22)*(x7'-mu22)')/44;
sigma23=((y7'-mu23)*(y7'-mu23)')/45;
sigma24=((z7'-mu24)*(z7'-mu24)')/46;
g22=logmvnpdf(Q7(:,[1,2,3,4]),mu22,sigma22)';
g23=logmvnpdf(Q7(:,[1,2,3,4]),mu23,sigma23)';
g24=logmvnpdf(Q7(:,[1,2,3,4]),mu24,sigma24)';
for i=1:15
    if(g22(i)>g23(i)&&g22(i)>g24(i))
        
        pr7(i)=1;
       
    end
    if(g23(i)>g22(i)&&g23(i)>g24(i))
       
        pr7(i)=2;
        
    end
    if(g24(i)>g22(i)&&g24(i)>g23(i))
        
        pr7(i)=3;
    end
    
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P8=N([1:120,136:150],:);
Q8=N(121:135,:);
P8=sortrows(P8,[5,1,2,3,4]);
x8=P8(1:47,[1,2,3,4]);
y8=P8(48:90,[1,2,3,4]);
z8=P8(91:135,[1,2,3,4]);
mu25=mean(x8)';
mu26=mean(y8)';
mu27=mean(z8)';
sigma25=((x8'-mu25)*(x8'-mu25)')/47;
sigma26=((y8'-mu26)*(y8'-mu26)')/43;
sigma27=((z8'-mu27)*(z8'-mu27)')/45;
g25=logmvnpdf(Q8(:,[1,2,3,4]),mu25,sigma25)';
g26=logmvnpdf(Q8(:,[1,2,3,4]),mu26,sigma26)';
g27=logmvnpdf(Q8(:,[1,2,3,4]),mu27,sigma27)';
for i=1:15
    if(g25(i)>g26(i)&&g25(i)>g27(i))
        
        pr8(i)=1;
       
    end
    if(g26(i)>g25(i)&&g26(i)>g27(i))
        
        pr8(i)=2;
        
    end
    if(g27(i)>g25(i)&&g27(i)>g26(i))
        
        pr8(i)=3;
    end
    
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P9=N(1:135,:);
Q9=N(136:150,:);
P9=sortrows(P9,[5,1,2,3,4]);
x9=P9(1:45,[1,2,3,4]);
y9=P9(46:93,[1,2,3,4]);
z9=P9(94:135,[1,2,3,4]);
mu28=mean(x9)';
mu29=mean(y9)';
mu30=mean(z9)';
sigma28=((x9'-mu28)*(x9'-mu28)')/45;
sigma29=((y9'-mu29)*(y9'-mu29)')/48;
sigma30=((z9'-mu30)*(z9'-mu30)')/42;
g28=logmvnpdf(Q9(:,[1,2,3,4]),mu28,sigma28)';
g29=logmvnpdf(Q9(:,[1,2,3,4]),mu29,sigma29)';
g30=logmvnpdf(Q9(:,[1,2,3,4]),mu30,sigma30)';
for i=1:15
    if(g28(i)>g29(i)&&g28(i)>g30(i))
        
        pr9(i)=1;
       
    end
    if(g29(i)>g28(i)&&g29(i)>g30(i))
        
        pr9(i)=2;
        
    end
    if(g30(i)>g28(i)&&g30(i)>g29(i))
        
        pr9(i)=3;
    end
    
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ex=Q(:,5)';
error = sum(ex ~= pr) / 15;
errorPercentage = 100*error;
accuracy1=1-error;
fprintf('Accuracy for iteration 1 = %12.8f\n',accuracy1)
ex1=Q1(:,5)';
error1= sum(ex1 ~= pr1) / 15;
errorPercentage1 = 100*error1;
accuracy2=1-error1;
fprintf('Accuracy for iteration 2 = %12.8f\n',accuracy2)
ex2=Q2(:,5)';
error2 = sum(ex2 ~= pr2) / 15;
errorPercentage2 = 100*error2;
accuracy3=1-error2;
fprintf('Accuracy for iteration 3 = %12.8f\n',accuracy3)
ex3=Q3(:,5)';
error3 = sum(ex3 ~= pr3) / 15;
errorPercentage3 = 100*error3;
accuracy4=1-error3;
fprintf('Accuracy for iteration 4 = %12.8f\n',accuracy4)
ex4=Q4(:,5)';
error4 = sum(ex4 ~= pr4) / 15;
errorPercentage4 = 100*error4;
accuracy5=1-error4;
fprintf('Accuracy for iteration 5 = %12.8f\n',accuracy5)
ex5=Q5(:,5)';
error5 = sum(ex5 ~= pr5) / 15;
errorPercentage5 = 100*error5;
accuracy6=1-error5;
fprintf('Accuracy for iteration 6 = %12.8f\n',accuracy6)
ex6=Q6(:,5)';
error6 = sum(ex6 ~= pr6) / 15;
errorPercentage6 = 100*error6;
accuracy7=1-error6;
fprintf('Accuracy for iteration 7 = %12.8f\n',accuracy7)
ex7=Q7(:,5)';
error7 = sum(ex7 ~= pr7) / 15;
errorPercentage7 = 100*error7;
accuracy8=1-error7;
fprintf('Accuracy for iteration 8 = %12.8f\n',accuracy8)
ex8=Q8(:,5)';
error8 = sum(ex8 ~= pr8) / 15;
errorPercentage8 = 100*error8;
accuracy9=1-error8;
fprintf('Accuracy for iteration 9 = %12.8f\n',accuracy9)
ex9=Q9(:,5)';
error9 = sum(ex9 ~= pr9) / 15;
errorPercentage9 = 100*error9;
accuracy10=1-error9;
fprintf('Accuracy for iteration 10 = %12.8f\n',accuracy10)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
avg_error=(error1+error2+error3+error4+error5+error6+error7+error8+error9+error10)/10;
avg_accuracy=1-avg_error;
fprintf('Average Accuracy = %12.8f\n',avg_accuracy)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [logp] = logmvnpdf(x,mu,Sigma)
% outputs log likelihood array for observations x  where x_n ~ N(mu,Sigma)
% x is NxD, mu is 1xD, Sigma is DxD

[N,D] = size(x);
%const = -0.5 * D * log(2*pi);

xc = bsxfun(@minus,x,mu');

term1 = -0.5 * sum((xc / Sigma) .* xc, 2); % N x 1
term2 = - 0.5 * log(det(Sigma))+log(1/3);    % scalar
logp = term1' + term2;

end

