function [ rate ] = misclassification_rate( predicted_labels, true_labels )

    N = numel(true_labels);
    num_misclassified = sum( predicted_labels ~= true_labels );
    rate = num_misclassified / N;

end

