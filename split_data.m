function [ train_set test_set train_labels test_labels ] = split_data( data, labels, test_percent )
%split_data splits a data set into training and testing sets. If labels are
% also passed in they are split as well. Optional test_percent parameter
% determines what percentage of the original data set should be put aside
% for the test set (default is 25%)
    
    N = numel(data(:,1));
    
    if isempty(test_percent)
        test_percent = .25;
    end
    
    test_size = floor( N * test_percent);
    test_indices = randperm(N, test_size);
    
    test_set = data(test_indices, :);
    
    data(test_indices,:) = [];
    train_set = data;
    
    if ~isempty(labels)
        test_labels = labels(test_indices, :);
        labels(test_indices,:) = [];
        train_labels = labels;
    else
        train_labels = [];
        test_labels = [];
    end   
        
    
end

