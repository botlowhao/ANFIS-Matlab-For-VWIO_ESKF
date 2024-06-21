% Function to generate a multi-step custom membership function
% using 2 parameters for the input argument x
function out = custmf3(x,params)
%CUSTMF3 此处显示有关此函数的摘要
%   此处显示详细说明

for i = 1:length(x)
    if x(i) < params(1)
        y(i) = 0;
    elseif x(i) >= params(1) && x(i) <= (params(1) + params(2)) / 2
        y(i) = 2 * ((x(i) - params(1)) / (params(2) - params(1))).^2;
    elseif x(i) > (params(1) + params(2)) / 2 && x(i) <= params(2)
        y(i) = 1 - 2 * ((x(i) - params(2)) / (params(2) - params(1))).^2;
    else
        y(i) = 0;
    end
end

% Scale the output to the range [0,1].
out = y'; 
end
