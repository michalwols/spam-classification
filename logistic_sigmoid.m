function [ y ] = logistic_sigmoid( a )

    y = 1 ./ ( 1 + exp( -a ));
    
end

