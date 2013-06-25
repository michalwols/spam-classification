classdef fishers_linear_discriminant
    % 2 class fisher's linear disctriminant
    
    properties
        weights
        C1_mean
        C2_mean
        between_class_covariance
        within_class_covariance
        threshold
    end
    
    methods
        function obj = fishers_linear_discriminant( features, labels )
            C1_features = 
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