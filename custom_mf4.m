function mu = custom_mf4(x, params)
%CUSTOM_MF4 p approaches negative infinity(Slipper Turning)
%   此处显示详细说明
    Am4 = params(1);
    if x < Am4
        mu = 1;
    elseif x >=Am4 && x<=(Am4 - 1)/ 2
         mu = 1 - 2 * ((x - Am4) / (-1 - Am4))^2;
    elseif x>= (Am4 - 1)/ 2 && x <= -1
        mu = 2 * ((x+1) / (-1 - Am4))^2;
    else
        mu = 0;
    end
end

