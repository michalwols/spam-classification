function [ w ] = newtons_method( Phi, t, y_func )
% Phi is the matrix of feature vectors in row order
% t contains true class labels for each feature
% y_func is a function handle
    
    w = ones( numel( Phi(1,:)), 1)/1000000;
    
    for i=0:3
        
        a = Phi * w;
        y = y_func( a );
        R = diag( y .* (1 - y) );
        z = Phi * w - (R) \ ( y - t );
        w = ( Phi' * R * Phi) \ Phi' * R * z; 
        
    end

end

