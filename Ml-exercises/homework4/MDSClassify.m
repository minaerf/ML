function [ ] = MDSClassify(X, TestInputData, TrainClass, TestClass)
%linearC = classify(TestInputData, X, TrainClass, 'linear');
diaglinearC = classify(TestInputData, X, TrainClass, 'diaglinear');
%quadraticC = classify(TestInputData, X, TrainClass, 'quadratic');
diagquadraticC = classify(TestInputData, X, TrainClass, 'diagquadratic');

%diaglinearPerf = classperf(TestClass, diaglinearC);
%diagquadraticPerf = classperf(TestClass, diagquadraticC);

diaglinearConfMat = confusionmat(TestClass, diaglinearC);
diagquadraticConfMat = confusionmat(TestClass, diagquadraticC);

diaglinear_tp = TP_ARR(diaglinearConfMat);
diaglinear_fp = FP_ARR(diaglinearConfMat);
diaglinear_tn = TN_ARR(diaglinearConfMat);
diaglinear_fn = FN_ARR(diaglinearConfMat);
diaglinear_precision = PRC(diaglinear_tp,diaglinear_fp);
diaglinear_recall = RCL(diaglinear_tp,diaglinear_fn);
diaglinear_fmeasure = FM(diaglinear_precision, diaglinear_recall);

diagquadratic_tp = TP_ARR(diagquadraticConfMat);
diagquadratic_fp = FP_ARR(diagquadraticConfMat);
diagquadratic_tn = TN_ARR(diagquadraticConfMat);
diagquadratic_fn = FN_ARR(diagquadraticConfMat);
diagquadratic_precision = PRC(diagquadratic_tp, diagquadratic_fp);
diagquadratic_recall = RCL(diagquadratic_tp, diagquadratic_fn);
diagquadratic_fmeasure = FM(diagquadratic_precision, diagquadratic_recall);

disp('Diaglinear Statics:');
dataset({[diaglinear_tp; diaglinear_fp; diaglinear_tn; diaglinear_fn] 'Walking', 'Walking_upstais', 'Walking_Downstairs', 'Sitting', 'Standing', 'Laying'}, ...
                'obsnames', {'tp', 'fp', 'tn', 'fn'})
            
disp('Diagquadratic Statics:');
dataset({[diagquadratic_tp; diagquadratic_fp; diagquadratic_tn; diagquadratic_fn] 'Walking', 'Walking_upstais', 'Walking_Downstairs', 'Sitting', 'Standing', 'Laying'}, ...
                'obsnames', {'tp', 'fp', 'tn', 'fn'})

disp('Diaglinear Precision:');
dataset({diaglinear_precision 'Walking', 'Walking_upstais', 'Walking_Downstairs', 'Sitting', 'Standing', 'Laying'}, ...
                'obsnames', {'prcs'})

disp('Diagquadratic Precision:');
dataset({diagquadratic_precision 'Walking', 'Walking_upstais', 'Walking_Downstairs', 'Sitting', 'Standing', 'Laying'}, ...
                'obsnames', {'prcs'})
            
disp('Diaglinear Recall:');
dataset({diaglinear_recall 'Walking', 'Walking_upstais', 'Walking_Downstairs', 'Sitting', 'Standing', 'Laying'}, ...
                'obsnames', {'recl'})

disp('Diagquadratic Recall:');
dataset({diagquadratic_recall 'Walking', 'Walking_upstais', 'Walking_Downstairs', 'Sitting', 'Standing', 'Laying'}, ...
                'obsnames', {'recl'})
            
disp('Diaglinear F Measure:');
dataset({diaglinear_fmeasure 'Walking', 'Walking_upstais', 'Walking_Downstairs', 'Sitting', 'Standing', 'Laying'}, ...
                'obsnames', {'fmsur'})
            
disp('Diagquadratic F Measure:');
dataset({diagquadratic_fmeasure 'Walking', 'Walking_upstais', 'Walking_Downstairs', 'Sitting', 'Standing', 'Laying'}, ...
                'obsnames', {'fmsur'})
end

