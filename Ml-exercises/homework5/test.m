    sub = readtable('./Jetris/ATESTvariables_1800.csv');
    subname ='1800';
    Trace = DataCombiner(MainSplitter(subname), sub);
    Model = TrainModel(Trace);
    %clear Q
    %%%%
    Q = BuildQTable();
    %%%%
    
    s = [0, 0, 0, 0, 0];
    a = [10, 2, 0];

    nogoal = 1;
    time = 0;
    while (nogoal)
        time = time + 1;  
      
        %a = ChooseAction(squeeze(Model(s(1)+1, s(2)+1, s(3)+1, s(4)+1, s(5)+1,:,:)));
        sp = DoAction(Trace, s, a);

        Q = UpdateQLearning( s, a, sp, Q, Model )
        if (IsGoal(sp, time))
            nogoal = 0;
        end
        s = sp;
    end
    
    