function tn = TN(confmat, i)
    tn = 0;
    for a = 1:6
        if a ~= i
            tn = tn + confmat(a,a);
        end
    end
end
