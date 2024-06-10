function mu = custom_mf5(x, Am5, Am6)
%CUSTOM_MF5 w ��С ����ת�� Slow Turning
%   �˴���ʾ��ϸ˵��
    if x < Am5
        mu = 1;
    elseif x >=Am5 && x<=(Am5 + Am6)/ 2
         mu = 1 - 2 * ((x - Am5) / (Am6 - Am5))^2;
    elseif x>= (Am5 + Am6)/ 2 && x <= Am6
        mu = 2 * ((x - Am6) / (Am6 -  Am5))^2;
    else
        mu = 0;
    end
end
