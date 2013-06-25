function [ coded_labels ] = binary_encode( labels )
%binary_encode Outputs a 1-of-K binary coding representation of the class
%label vector. Assumes classes are numbered 0...K-1
    num_classes = max( labels ) + 1;
    coded_labels = zeros( numel(labels), num_classes );
    labels = labels + 1;
    indices = sub2ind(size(coded_labels), 1:numel(labels), labels');
    coded_labels(indices) = 1;


end

