function mu = custom_mf3(x, Am3)
%CUSTOM_MF3 此处显示有关此函数的摘要
%   此处显示详细说明
    if x > 1
        mu = 0;
    elseif x == 1
        mu = 1;
    elseif x <= 1 && x >= (Am3 + 1) / 2
        mu = 1 - 2 * ((x - 1) / (Am3 - 1))^2;
    elseif x<= (Am3 + 1) / 2 && x > Am3
        mu = 2 * ((x - Am3) / (Am3 - 1))^2;
    else
        mu = 0;
    end
end

