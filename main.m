features = importdata('spam.data');
labels = importdata('spam.traintest');

[ features test_features labels test_labels ] = split_data(features, labels , []);