classdef least_squares_classifier
    %least_squares_classifier uses the closed form solution for least
    % squares to compute weights for a given features (input vectors) and
    % labels (binary coded target values)
    
    properties
        weights
    end
    
    methods
        function obj = least_squares_classifier( features, labels )
            % assumes features are augmented with a leading 1 for the bias
            % paramteter and labels are 1-of-K binary coded
            obj.weights = (features' * features) \ features' * labels;
        end
        
        function predictions = evaluate(self, features)
            predictions = features * self.weights;
        end
        
        function predicted_labels = classify(self, features)
            predictions = self.evaluate(features);
            [~, predicted_labels] = max(predictions,[],2);
            predicted_labels = predicted_labels - 1;
            
        end
    end
    
end

