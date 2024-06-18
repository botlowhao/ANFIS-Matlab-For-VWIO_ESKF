function mu = custom_mf2(x, params)
%CUSTOM_MF2 p approaches 1(Straight forward)
% 
    Am2 = params(1);
    if x < 1
        mu = 0;
    elseif x == 1
        mu = 1;
    elseif x >= 1 && x <= (Am2 + 1) / 2
        mu = 1 - 2 * ((x - 1) / (Am2 - 1))^2;
    elseif x>= (Am2 + 1) / 2 && x <= Am2
        mu = 2 * ((x - Am2) / (Am2 - 1))^2;
    else
        mu = 0;
    end
end
