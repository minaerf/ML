function [ I ] = search( Trace, s, a )
    tracesize = size(Trace,1);
    I = 0;
    for i=1:tracesize
        if (Trace{i,1} == s(1) && Trace{i,2} == s(2) && Trace{i,3} == s(3) ...
            && Trace{i,4} == s(4) && Trace{i,5} == s(5) ....
            && Trace{i,8} == a(1) && Trace{i,9} == a(2))
                I = i;
            break;
        end
    end
end

