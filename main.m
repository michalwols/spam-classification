features = importdata('spam.data');
labels = importdata('spam.traintest');

[ features test_features labels test_labels ] = split_data(features, labels , []);

N = numel(features(:,1));

% matrix of augmented (with a leading 1 for the bias term) feature vectors
% (in row order)
X = [ones(N,1) features];

% 1-of-K binary coded target class vector
t = binary_encode(labels);

% create and train least squares classifier 
least_sqrs = least_squares_classifier(X, t);

predicted_labels = least_sqrs.classify( [ones( numel(test_labels), 1 ) test_features] );

least_sqrs_miss_rate = misclassification_rate(predicted_labels, test_labels);


% logistic regression:

% estimate weights using Newton's method  
w = newtons_method( features, labels, @logistic_sigmoid);

% predict labels
y = logistic_sigmoid( test_features * w );
predicted_labels = round( y );

% calculate misclassification rate
logistic_regr_miss_rate = misclassification_rate(predicted_labels, test_labels);