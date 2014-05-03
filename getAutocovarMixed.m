function [ gamma_array ] = getAutocovarMixed(AR, MA, precision, MA_el)
    p = length(AR);
    q = length(MA);
    [Psi_p, Psi_q] = getAutocovMixedRecur(AR, MA, max(p, q), precision, MA_el);
    
    gamma_array = zeros(p, q);
    for i = 1:p
        for j = 1:q
            if (i < j)
                gamma_array(i, j) = sum(reshape(Psi_p((j - i + 1):(end)), [], 1).*reshape(Psi_q(1:(end - j + i)), [], 1), 'double');
            else
                gamma_array(i, j) = sum(reshape(Psi_p(1:(end - i + j)), [], 1).*reshape(Psi_q((i - j + 1):end), [], 1), 'double');
            end
        end
    end
    
end

