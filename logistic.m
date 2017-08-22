clear all; close all; clc;
data = dlmread('corrupted_2class_iris_dataset.dat');
N = 100; % total number of samples
NC = 50; % size of each class
K = 10; % K-fold
d = 4; % number of features
nu = 0.01; % learning rate
% Randomly shuffle data
%seed = 150; rand('seed', seed);
index = randperm(N);
data_shuffled = data(index,:);
%modify inout X to desired form 
data_shuffled_labels = data_shuffled(:,[5]);
kincrement = N/K;
data_shuffled = circshift(data_shuffled, [0, 1]);
data_shuffled(:,[1])=1;

% 10-fold cross validation
J_store = [];
accuracy_store = [];
for k=1:K
% Separate training data and test data
% 90% of the data for training, 10% for testing

data_copy = data_shuffled; % making a temp copy of the dataset
data_test = data_copy(10*(k-1) + 1:10*(k-1)+K,:); % testing dataset
data_copy(10*(k-1) + 1:10*(k-1)+K,:) = []; 
data_train = data_copy; % training dataset

data_copy_labels = data_shuffled_labels;
data_test_labels = data_copy_labels(10*(k-1) + 1:10*(k-1)+K,:); % testing dataset for labels
data_copy_labels(10*(k-1) + 1:10*(k-1)+K,:) = []; 
data_train_labels = data_copy_labels; %training dataset for labels

% TRAINING
% Size X = 90x5, the first column = 1
X = data_train;
% Size y = 90x1 (class 1 and class 0 labels)
y = data_train_labels;
% Size w = 5x1, initialized randomly, w1 is the bias
w = rand(5,1);
% Apply Gradient Descent and run for 1500 iterations

MAX_ITERATIONS = 1500;
J_actual = [];
for itr=1:MAX_ITERATIONS
    temp_j1 = 0;
    temp_j2 = 0;
    temp_j3 = 0;
    temp_j4 = 0;
    temp_j5 = 0;
    J = 0;
    for inner_iter=1:(N-10)
         sigmoid = (1 + exp(-(X(inner_iter,:)*w)))^(-1);
         temp_j1 = temp_j1 + ( sigmoid - y(inner_iter) ) * X(inner_iter, 1);
         temp_j2 = temp_j2 + ( sigmoid - y(inner_iter) ) * X(inner_iter, 2);
         temp_j3 = temp_j3 + ( sigmoid - y(inner_iter) ) * X(inner_iter, 3);
         temp_j4 = temp_j4 + ( sigmoid - y(inner_iter) ) * X(inner_iter, 4);
         temp_j5 = temp_j5 + ( sigmoid - y(inner_iter) ) * X(inner_iter, 5);
         J = J - ( (y(inner_iter) * log ( sigmoid)) + ((1 - y(inner_iter)) * log((1 - sigmoid))));
    end
    w(1) = w(1) - ( nu * (1/(N-10)) * temp_j1 );
    w(2) = w(2) - ( nu * (1/(N-10)) * temp_j2 );
    w(3) = w(3) - ( nu * (1/(N-10)) * temp_j3 );
    w(4) = w(4) - ( nu * (1/(N-10)) * temp_j4 );
    w(5) = w(5) - ( nu * (1/(N-10)) * temp_j5 );  
    J_actual(itr) = J;
end
J_store(k,:) = J_actual(:);
% TESTING
% Compute sigm for each test data and assign label
% Check against true response
% Size X_test = 10x5, the first column = 1
X_test = data_test;
% Size y = 10x1 (class 1 and class 0 labels)
y_test = data_test_labels;
accuracy_count = 0;
for ii=1:10
    if (1 + exp(-(X_test(ii,:)*w)))^(-1) > 0.5
        yhat = 1;
    else 
        yhat = 0;
    end
    if yhat == y_test(ii)
        accuracy_count = accuracy_count + 1;
    end
end  
accuracy = accuracy_count / 10;
accuracy_store = [accuracy_store, accuracy];
end
% Evaluate classification accuracy
% Accuracy per iteration = no of correct classification / 10
% Average accuracy for all 10-fold CV
% fprintf('Accuracy = %5.4f\n', ...) generates nice format
accuracy_per_iteration = accuracy_store;
fprintf('Classification Accuracy = \n')
fprintf('%5.4f\n',accuracy_per_iteration) %generates nice format
average_accuracy = mean(accuracy_per_iteration);
fprintf('Average Accuracy = %5.4f\n', average_accuracy)
% Plot cost function vs training iterations
plotvalue = 5; %cahnge this value to pick a different output based on K fold
plot (J_store(plotvalue,:)'); % Size J = 1500x1
xlabel('Training iterations');
ylabel('Cost function J');