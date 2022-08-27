function [ sp ] = DoAction(Trace, s, a )
    I = search(Trace, s, a);
    Ip = I + 1;
    xp = {Trace{Ip,1:9}};
    sp = [xp{1,1} xp{1,2} xp{1,3} xp{1,4} xp{1,5}];
end






