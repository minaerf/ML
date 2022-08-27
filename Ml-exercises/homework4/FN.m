function fn = FN(confmat, i)
    fn = 0;
    for a = 1:6
        if a ~= i
            fn = fn + confmat(a,i);
        end
    end
end

