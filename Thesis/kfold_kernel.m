function [predicted_label, conf_matrix, accuracy, tp_fp] = kfold_kernel(shuffeled_dataset, cv)

    
    trIdx = zeros(10,27900);
    teIdx = zeros(10,3100);

    for i = 1:10
        trIdx(i,:) = find(cv.training(i)==1);
        teIdx(i,:) = find(cv.test(i)==1);
    end
    
    
    predicted_label = zeros(cv.TestSize(1,1), 10);
    accuracy = zeros(3,10);
    tp_fp = zeros(31,1);
    conf_matrix = zeros(31,31);
    

    for fold = 1:10
        
        load(strcat('\meaning_kernel\fold', num2str(fold), '\meaning_score.mat'));
        load(strcat('\meaning_kernel\fold', num2str(fold), '\sorted_score.mat'));
        load(strcat('\meaning_kernel\fold', num2str(fold), '\sorted_score_index.mat'));
        
        train_label = shuffeled_dataset(trIdx(fold,:),end);
        test_label = shuffeled_dataset(teIdx(fold,:),end);
        
        train_set = shuffeled_dataset(trIdx(fold,:),1:end-1);
        test_set = shuffeled_dataset(teIdx(fold,:),1:end-1);
        
        selected_features = zeros(size(train_set,1)+1,100);
        threshold = zeros(31,1);
        for i = 1:31
            threshold(i,1) = size(find(sorted_score(i,:) > 0.5),2);  % sorted_score(i) = scoes for filetype
        end
        l = 1;
        for m = 1:31
            for j = 1:threshold(m,1)
                k = sorted_score_index(m,j);
                for i = 1:l
                    if selected_features(end,i) == k
                        break;
                    elseif i == l
                        l = l + 1;
                        selected_features(1:end-1,l) = train_set(1:end,k);
                        selected_features(end,l) = k;
                        break;
                    end
                end
            end
        end
        selected_features(:,1) = [];
        train_set = selected_features;

        selected_features = zeros(size(test_set,1)+1,100);
        l = 1;
        for m = 1:31
            for j = 1:threshold(m,1)
                k = sorted_score_index(m,j);
                for i = 1:l
                    if selected_features(end,i) == k
                        break;
                    elseif i == l
                        l = l + 1;
                        selected_features(1:end-1,l) = test_set(1:end,k);
                        selected_features(end,l) = k;
                        break;
                    end
                end
            end
        end
        selected_features(:,1) = [];
        test_set = selected_features;

        M = zeros(31,size(test_set,2));
        for i = 1:size(test_set,2)
            index = test_set(end,i);
            M(1:31,i) = meaning_score(1:31,index);
        end
        M = M';
        
         test_set = test_set(1:end-1,:);
        train_set = train_set(1:end-1,:);


        kernel = @(X,Y) (X*M)*M'*Y;
        numTrain = size(train_set,1);
        numTest = size(test_set,1);
        K =  [ (1:numTrain)' , kernel(train_set,train_set') ];
        KK = [ (1:numTest)'  , kernel(test_set,train_set')  ];
        cmd = '-t 4 -q -c 0.5 -b 1';
        model = svmtrain(train_label, (K), cmd);
        [p_label, accuracy, prob] = svmpredict(test_label, (KK), model, '-b 1');
        predicted_label(:,fold) = p_label;
        accuracy(:,fold) = accuracy;
        for j = 1:size(p_label,1)
            conf_matrix(test_label(j,1),p_label(j,1)) =  conf_matrix(test_label(j,1),p_label(j,1)) + 1;
        end
        save(strcat('\meaning_kernel\model',num2str(fold),'.mat'), 'model', '-v7.3');
        save(strcat('\meaning_kernel\prob',num2str(fold),'.mat'), 'prob', '-v7.3');
    end
    
    
    
    for i = 1:31
         summation = 0;
         tp = 0;
         for j = 1:31
             if i == j
                 tp = conf_matrix(i,i);
                 continue;
             else
                 summation = summation + conf_matrix(j,i);
             end
         end
         tp_fp(i,2) = (summation/30000)*100;
         tp_fp(i,1) = (tp/1000)*100;
    end

end

