function [ Trace ] = DataCombiner(main, sub)
    mainsize = size(main,1);
    subsize = size(sub,1);
    stub = cell(mainsize,2);

    main = [main stub];
    i = 1;
    j = 1;
    while (j < subsize)
        while (i < mainsize)
            x1 = sub{j,4};
            x2 = val(main{i,4});
            if (round(x1,2) == round(x2,2))
                main{i,17} = sub{j,6};
                main{i,18} = sub{j,7};
            else
                break;
            end
            i = i + 1;
        end
        j = j + 1;
    end
    
    Trace = cell(mainsize, 9);
    
    for i=1:mainsize
        Trace{i,1} = val(main{i,7});
        Trace{i,2} = val(main{i,8});
        Trace{i,3} = val(main{i,9});
        Trace{i,4} = val(main{i,10});
        Trace{i,5} = val(main{i,11});
        Trace{i,6} = val(main{i,12});
        Trace{i,7} = val(main{i,13});
        Trace{i,8} = main{i,17};
        Trace{i,9} = main{i,18};
    end
    
    clear main
    clear sub
    
end

