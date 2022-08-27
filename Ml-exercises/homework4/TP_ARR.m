function [tp] = TP_ARR(confmat)
    tp = zeros(1,6);
    for i = 1:6 
      tp(i) = TP(confmat,i);
    end
end
