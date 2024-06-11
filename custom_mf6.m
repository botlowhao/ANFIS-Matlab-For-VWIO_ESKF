function mu = custom_mf6(x, Am7, Am8)
%CUSTOM_MF6 w Larger(Quickly Turning)
%   此处显示详细说明
    if x < Am7
        mu = 0;
    elseif x >=Am7 && x<=(Am7 + Am8)/ 2
         mu = 2 * ((x - Am7) / (Am8 -  Am7))^2;
    elseif x>= (Am7 + Am8)/ 2 && x <= Am8
        mu = 1 - 2 * ((x - Am8) / (Am8 - Am7))^2;
    else
        mu = 1;
    end
end