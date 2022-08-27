function [ Model ] = TrainModel( Trace )
    tracesize = size(Trace,1);
    Model = BuildModel();
    
    for i=1:tracesize
        holes = floor(Trace{i,1}) + 1;
        stackmin = floor(Trace{i,2}) + 1;
        stackmax = floor(Trace{i,3}) + 1;
        stackmean = floor(Trace{i,4}) + 1;
        stackdev = floor(Trace{i,5}) + 1;
        rows = floor(Trace{i,8}) + 1;
        cols = floor(Trace{i,9}) + 1;
        reward = Trace{i,6} - Trace{i,7};
        
        if (stackmean > 20) stackmean = 10; end
        if (stackdev > 20) stackdev = 5; end
        
        if (isa(rows,'numeric') && isa(cols,'numeric') ...
                && isa(holes,'numeric') && isa(stackmax,'numeric') ...
                && isa(stackmin,'numeric') && isa(stackmean,'numeric') ...
                && isa(stackdev,'numeric'))
        
            if (Model(holes,stackmax,stackmin,stackmean,stackdev,rows,cols) > 0)
                xtmp = Model(holes,stackmax,stackmin,stackmean,stackdev,rows,cols);
                Model(holes,stackmax,stackmin,stackmean,stackdev,rows,cols) = ...
                    (xtmp + reward)/2;
            else
                Model(holes,stackmax,stackmin,stackmean,stackdev,rows,cols) = reward;
            end
        end
    end

end

