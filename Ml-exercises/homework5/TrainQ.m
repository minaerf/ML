function [ ] = TrainQ( Q, Model, Trace )
    s = GetInitialState();

    nogoal = 1;
    time = 0;
    while (nogoal)
        time = time + 1;        
        a = ChooseAction(squeeze(Model(s(1)+1, s(2)+1, s(3)+1, s(4)+1, s(5)+1,:,:)));
        sp = DoAction(Trace, s, a);

        Q = UpdateQLearning( s, a, sp, Q, Model )
        if (IsGoal(sp, time))
            nogoal = 0;
        end
        s = sp;
    end
end

