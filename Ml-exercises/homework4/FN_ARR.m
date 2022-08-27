function [fn] = FN_ARR(confmat)
    fn = zeros(1,6);
    for i = 1:6 
      fn(i) = FN(confmat,i);
    end
end
