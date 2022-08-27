function [ output_args ] = Episoder(subname, sub, Q, Model, gamma)
    main = MainSplitter(subname);
    Trace = DataCombiner(main, sub);
    Model = TarinModel(Trace);
end

