M=dlmread('housing_price_data.dat');
Price=M(:,2);
Size=M(:,5);
z=sortrows([Size Price]);
figure('name','Scatter plot of housing prices')
scatter(Size,Price)
title('Scatter plot of housing prices')
xlabel('Size in Square Feet')
ylabel('Price')
title('Housing Prices'); 
x1=z(25:600,1);
y=z(25:600,2);
maxX=max(x1);
minX=min(x1);
norm=maxX-minX;
x=(x1)/(maxX-minX);
x = [ones(length(x), 1) x];
 
parameters = [0; 0];

learningRate = 0.4;

repetition = 2000;

[parameters, costHistory] = gradient(x, y, parameters, learningRate, repetition);

figure('name','cost history');

plot(1:repetition,costHistory);
xlabel('Iterations'); ylabel('Error');
figure; hold off;
scatter(x(:,2)*norm,y, 100, '.'); hold;
plot(x(:,2)*norm,parameters(1) + parameters(2) * (x(:,2)),'r');

  
xlabel('Size in square Feet'); ylabel('Price');
fprintf('Algorithm converges after %d iterations, learning rate=%5.3f \n', repetition, learningRate);

% Gradient function
function [ parameters, costHistory ] = gradient( x, y, parameters, learningRate, repetition )
    
    m = length(y);
    costHistory = zeros(repetition, 1);
    for i = 1:repetition
        h = (x * parameters - y)';
        temp0 = parameters(1) - learningRate * (1/m) * h * x(:, 1);
        temp1 = parameters(2) - learningRate * (1/m) * h * x(:, 2);
        parameters(1)=temp0;
        parameters(2)=temp1;
        costHistory(i) = cost(x, y, parameters);
        
    end
    
end

% Cost History

function [ cost1 ] = cost( x, y, parameters )
    cost1 = (x * parameters - y)' * (x * parameters - y) / (2 * length(y));
    
end

