function [fp] = FP_ARR(confmat)
    fp = zeros(1,6);
    for i = 1:6 
      fp(i) = FP(confmat,i);
    end
end

