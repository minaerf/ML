function [precision] = PRC(tp, fp)
    precision = zeros(1,6);
    for i = 1:6
        precision(i) = tp(i)/(tp(i) + fp(i));
    end
end

