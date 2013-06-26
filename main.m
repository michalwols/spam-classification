data = importdata('spam.data');

%%% 1. Split the data
[ features test_features labels test_labels ] = split_data(data(:,1:end-1), data(:,end) , []);

N = numel(features(:,1));

% matrix of augmented (with a leading 1 for the bias term) feature vectors
% (in row order)
X = [ones(N,1) features];

% 1-of-K binary coded target class vectormi
t = binary_encode(labels);


%%% 2. Least Squares:
% create and train least squares classifier 
least_sqrs = least_squares_classifier(X, t);
predicted_labels = least_sqrs.classify( [ones( numel(test_labels), 1 ) test_features] );
least_sqrs_miss_rate = misclassification_rate(predicted_labels, test_labels);


%%% 3.

% Fisher's Linear Discriminant
fish = fishers_linear_discriminant(features, labels);
predicted_labels = fish.classify(test_features);
fish_miss_rate = misclassification_rate(predicted_labels, test_labels);

% Logistic Regression:
w = newtons_method( features, labels, @logistic_sigmoid);
y = logistic_sigmoid( test_features * w );
predicted_labels = round( y );
logistic_regr_miss_rate = misclassification_rate(predicted_labels, test_labels);

