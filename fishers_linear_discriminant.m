classdef fishers_linear_discriminant
    % 2 class fisher's linear disctriminant
    
    properties
        weights
        C1_mean
        C2_mean
        total_mean
        Sw
    end
    
    methods
        function obj = fishers_linear_discriminant( features, labels )
            C1_features = features( labels == 0, : );
            C2_features = features( labels == 1, : );
            
            obj.total_mean = mean( features, 1)';
            obj.C1_mean = mean(C1_features, 1)';
            obj.C2_mean = mean(C2_features, 1)';
            
            C1_diff = bsxfun(@minus, C1_features, obj.C1_mean');
            C2_diff = bsxfun(@minus, C2_features, obj.C2_mean');
            obj.Sw = C1_diff' * C1_diff + C2_diff' * C2_diff;
            obj.weights = (obj.Sw)\(obj.C2_mean - obj.C1_mean);
            
            % normalize the weights to unit length
            obj.weights = obj.weights / norm( obj.weights );
        end
        
        function labels = classify(self, features)
            labels = ( bsxfun(@minus, features, self.total_mean') * self.weights ) > 0; 
        end
 
    end
    
end