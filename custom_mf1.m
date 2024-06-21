function mu = custom_mf1(x, params)
%CUSTOM_MF1 p approaches positive infinity(Slipper Turning)
% 
    Am1 = params(1);
    if x < 1
        mu = 0;
    elseif x >=1 & x<=(Am1 + 1)/ 2
        mu = 2 * ((x-1) / (Am1 - 1))^2;
    elseif x>= (Am1 + 1)/ 2 & x<Am1
        mu = 1 - 2 * ((x - Am1) / (Am1 - 1))^2;
    else
        mu = 1;
    end
end

