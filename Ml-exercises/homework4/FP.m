function fp = FP(confmat, i)
    fp = 0;
    for a = 1:6
        if a ~= i
            fp = fp + confmat(i,a);
        end
    end
end
