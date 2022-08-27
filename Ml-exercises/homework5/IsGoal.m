function [ tf ] = IsGoal( s, t )
    tf = 0;
    if (t > 150000)
        if (s(1) > 15) %holes
            if (s(2) < 10) % stackmin
                if (s(3) > 5) %stackmax
                    if (s(4) < 10) %stackmean
                        if (s(5) < 5) %stackdev
                            tf = 1;
                        end
                    end
                end
            end
        end
    end
    if (t > 200000)
        tf = 1;
    end
end