function [ bestaction ] = ChooseAction( actionboard )
    maxr = 1;
    maxc = 1;
    maxv = 0;
    for row=1:21
        for col=1:16
            if (maxv < actionboard(row,col))
                maxr = row;
                maxc = col;
                maxv = actionboard(row,col);
            end
        end
    end
    
    bestaction = [maxr-1 maxc-1 maxv];
end

