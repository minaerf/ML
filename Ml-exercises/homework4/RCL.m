function [ recall ] = RCL(tp, fn)
    recall = zeros(1,6);
    for i = 1:6
        recall(i) = tp(i)/(tp(i) + fn(i));
    end
end

