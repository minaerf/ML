function [ Y ] = ReplaceMissingValues(X,regressor,sw)
    REG = zeros(size(X, 1));
    Y = X;
    if (sw == 0)
        if (regressor == 5)
           REG = NBregressor5(X);
        elseif (regressor == 10)
            REG = NBregressor10(X);
        elseif (regressor == 15)
            REG = NBregressor15(X);
        elseif (regressor == 20)
            REG = NBregressor20(X);
        elseif (regressor == 25)
            REG = NBregressor25(X);
        end
        for i = 1:size(X,1)
            if isnan(X(i,42))
                Y(i,42) = REG(i);
            end
        end
        if (regressor == 5)
            csvwrite('5NB.csv',Y);
        elseif (regressor == 10)
            csvwrite('10NB.csv',Y);
        elseif (regressor == 15)
            csvwrite('15NB.csv',Y);
        elseif (regressor == 20)
            csvwrite('20NB.csv',Y);
        elseif (regressor == 25)
            csvwrite('25NB.csv',Y);
        end
    end

    if (sw == 1)
        if (regressor == 5)
           REG = SVMregressor5(X);
        elseif (regressor == 10)
            REG = SVMregressor10(X);
        elseif (regressor == 15)
            REG = SVMregressor15(X);
        elseif (regressor == 20)
            REG = SVMregressor20(X);
        elseif (regressor == 25)
            REG = SVMregressor25(X);
        end
        for i = 1:size(X,1)
            if isnan(X(i,42))
                Y(i,42) = REG(i);
            end
        end
        if (regressor == 5)
            csvwrite('5SVM.csv',Y);
        elseif (regressor == 10)
            csvwrite('10SVM.csv',Y);
        elseif (regressor == 15)
            csvwrite('15SVM.csv',Y);
        elseif (regressor == 20)
            csvwrite('20SVM.csv',Y);
        elseif (regressor == 25)
            csvwrite('25SVM.csv',Y);
        end
    end
end

