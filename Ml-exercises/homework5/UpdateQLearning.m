function [ Q ] = UpdateQLearning( s, a, sp, Q, Model )
    gamma = 0.5;
    eta = 0.5;

    ap = ChooseAction(squeeze(Model(sp(1)+1, sp(2)+1, sp(3)+1, sp(4)+1, sp(5)+1,:,:)));    
    xq = Q(sp(1)+1, sp(2)+1, sp(3)+1, sp(4)+1, sp(5)+1, ap(1)+1, ap(2)+1);
    cq = Q(s(1)+1, s(2)+1, s(3)+1, s(4)+1, s(5)+1, a(1)+1, a(2)+1);
    r = a(3);
    
    TD_error =   ((r + gamma*xq) - cq);
    Q(s(1)+1, s(2)+1, s(3)+1, s(4)+1, s(5)+1, a(1)+1, a(2)+1) =  cq + eta * TD_error;
    
end

