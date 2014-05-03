function [series, epsilons] = simulateARMA(AR, MA, sigma2, T, N)
    
    p = length(AR);
    q = length(MA);
    r = max(p, q);
    
    series = zeros(T, N);
    epsilons = sqrt(sigma2) * randn(T, N);
        
   
    epsilons(1:r, :) = 0;
  
        
    series(r + 1, :) = epsilons(r + 1, :);
    
    for i = q + 1:T
        for j = 1:q
            series(i, :) = series(i, :) + MA(j) * epsilons(i - j, :);
        end
    end
            
    for i = r + 2:T
        for j = 1:p
            series(i, :) = series(i, :) + AR(j) * series(i - j, :);
        end
        series(i, :) = series(i, :) + epsilons(i, :);
    end
    
   


    
