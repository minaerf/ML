function [tn] = TN_ARR(confmat)
    tn = zeros(1,6);
    for i = 1:6 
      tn(i) = TN(confmat,i);
    end
end

