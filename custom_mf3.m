function mu = custom_mf3(x, params)
%CUSTOM_MF3 p approaches -1(Spin Turning)
%   此处显示详细说明
    Am3 = params(1);
    if x > -1
        mu = 0;
    elseif x == -1
        mu = 1;
    elseif x <= -1 & x >= (Am3 - 1) / 2
        mu = 1 - 2 * ((x + 1) / (-1 - Am3))^2;
    elseif x<= (Am3 - 1) / 2 & x > Am3
        mu = 2 * ((x - Am3) / (-1 - Am3))^2;
    else
        mu = 0;
    end
end

