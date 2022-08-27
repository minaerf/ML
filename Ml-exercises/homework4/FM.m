function [ fmeasure ] = FM(precision, recall)
   fmeasure = zeros(1,6);
    for i = 1:6
        fmeasure(i) = 2 * (precision(i) * recall(i)) / (precision(i) + recall(i));
    end
end

