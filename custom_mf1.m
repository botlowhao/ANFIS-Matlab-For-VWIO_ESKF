function mu = custom_mf1(x, Am1)
%CUSTOM_MF1 此处显示有关此函数的摘要
%   此处显示详细说明
    if x < 1
        mu = 0;
    elseif x >=1 && x<=(Am1 + 1)/ 2
        mu = 2 * ((x-1) / (Am1 - 1))^2;
    elseif x>= (Am1 + 1)/ 2 && x<Am1
        mu = 1 - 2 * ((x - Am1) / (Am1 - 1))^2;
    else
        mu = 1;
    end
end

