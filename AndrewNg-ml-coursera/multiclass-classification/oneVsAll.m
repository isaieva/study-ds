function [all_theta] = oneVsAll(X, y, num_labels, lambda)
% Train multiple logistic regression classifiers 

m = size(X, 1);
n = size(X, 2);

% theta values for each label
all_theta = zeros(num_labels, n + 1);

X = [ones(m, 1) X];

% Initial theta
initial_theta = zeros(n + 1, 1);
     
% Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 50);

% Obtain the optimal theta

for c = 1:num_labels
    [theta] = fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
                initial_theta, options);
    all_theta(c, :) = theta(:);
end












% =========================================================================


end