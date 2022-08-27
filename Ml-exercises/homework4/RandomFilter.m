function [ Y ] = RandomFilter(X, p)
    totalf = (p * size(X,1))/100;
    Y = X;
    rng;
    r = randi(size(X,1), [1,int16(totalf)]);
    for i = 1:totalf
        Y(r(i), 42) = NaN;
    end
end

