function mu = custom_mf1(x, Am1)
%CUSTOM_MF1 p 趋近于正无穷 急转弯 Slipper Turning
% 
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

