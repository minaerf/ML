function [ plane ] = MainSplitter(extract)
    filename = './Jetris/ALLCombinedVariables_timeseriesPupilEvolution.csv';
    [fh, errMsg] = fopen( filename, 'rt' );
    formatspec = '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s';
    found = false;
    i = 1;
    while ~feof( fh )
        row = textscan( fh, formatspec, 1, 'Delimiter', ',' );
        if (~ strcmp(row{1,15},'saccade'))
            if (strcmp(row{1,1},extract))
                plane(i,:) = row;
                i = i + 1;
                found = true;
            else
                if (found) 
                    break; 
                end
            end
        end
    end
    fclose(fh);
end

