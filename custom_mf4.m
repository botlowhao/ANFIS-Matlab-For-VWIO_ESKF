function mu = custom_mf4(x, Am4)
%CUSTOM_MF4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

