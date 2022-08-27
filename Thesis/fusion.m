function [cv, predicted_label1, predicted_label2, accuracy1, accuracy2, rand_idx, conf_matrix1, conf_matrix2] = fusion(dataset1, dataset2)

%% preprocessing

    set_size = size(dataset1,1);
    conf_matrix1 = zeros(31,31);
    conf_matrix2 = zeros(31,31);

    %observation labels
    labels = zeros(set_size,1);
    for i =1:31000
        labels(i,1) = floor((i-1)/1000)+1;
    end
    dataset1 = [dataset1,labels];
    dataset2 = [dataset2,labels];


    %shuffle datasets
    rand_idx = randperm(set_size);
    shuffeled_dataset1 = dataset1(rand_idx,:);
    shuffeled_dataset2 = dataset2(rand_idx,:);

%% cross validation partitioning

    k = 10; %number of folds for k-fold cross validation
    cv = cvpartition(set_size,'KFold',k);

    trIdx = zeros(k,27900);
    teIdx = zeros(k,3100);

    for i = 1:k
        trIdx(i,:) = find(cv.training(i)==1);
        teIdx(i,:) = find(cv.test(i)==1);
    end
    
    
%% SVM model for each of k partitions
    
    predicted_label1 = zeros(cv.TestSize(1,1), k);
    predicted_label2 = zeros(cv.TestSize(1,1), k);
    accuracy1 = zeros(3,k);
    accuracy2 = zeros(3,k);
    tp_fp1 = zeros(31,1);
    tp_fp2 = zeros(31,1);
    
    for i = 1:k
        
        train_label1 = shuffeled_dataset1(trIdx(i,:),end);
        test_label1 = shuffeled_dataset1(teIdx(i,:),end);
        
        train_set1 = shuffeled_dataset1(trIdx(i,:),1:end-1);
        test_set1 = shuffeled_dataset1(teIdx(i,:),1:end-1);
        
        train_label2 = shuffeled_dataset2(trIdx(i,:),end);
        test_label2 = shuffeled_dataset2(teIdx(i,:),end);
        
        train_set2 = shuffeled_dataset2(trIdx(i,:),1:end-1);
        test_set2 = shuffeled_dataset2(teIdx(i,:),1:end-1);
        
        %learn and predict with SVM linear kernel
        model1 = train(train_label1, sparse(train_set1), '-s 2 -c 256 -q');
        [p_label, accuracy, prob] = predict(test_label1, sparse(test_set1), model1, '-b 1');
        predicted_label1(:,i) = p_label;
        accuracy1(:,i) = accuracy;
        for j = 1:size(p_label,1)
            pl = p_label(j,1);
            conf_matrix1(test_label1(j,1),pl) =  conf_matrix1(test_label1(j,1),pl) + 1;
        end
        save(strcat('\fusion_model\learner1\model',num2str(i),'.mat'), 'model1', '-v7.3');
        save(strcat('\fusion_model\learner1\prob',num2str(i),'.mat'), 'prob', '-v7.3');
        
        %learn and predict with SVM polynomial kernel
        
        model2 = svmtrain(train_label2, sparse(train_set2), '-s 0 -t 1 -c 1 -h 0 -q -b 1');
        [p_label, accuracy, prob] = svmpredict(test_label2, sparse(test_set2), model2, '-b 1');
        predicted_label2(:,i) = p_label;
        accuracy2(:,i) = accuracy;
        for j = 1:size(p_label,1)
            pl = p_label(j,1);
            conf_matrix2(test_label2(j,1),pl) =  conf_matrix2(test_label2(j,1),pl) + 1;
        end
        save(strcat('\fusion_model\learner2\model',num2str(i),'.mat'), 'model2', '-v7.3');
        save(strcat('\fusion_model\learner2\prob',num2str(i),'.mat'), 'prob', '-v7.3');
    end
  
 %% false positive evaluation based on conf matrix
    
     for i = 1:31
         summation1 = 0;
         tp1 = 0;
         summation2 = 0;
         tp2 = 0;

         for j = 1:31
             if i == j
                 tp1 = conf_matrix1(i,i);
                 tp2 = conf_matrix2(i,i);
                 continue;
             else
                 summation1 = summation1 + conf_matrix1(j,i);
                 summation2 = summation2 + conf_matrix2(j,i);
             end
         end
         tp_fp1(i,2) = (summation1/30000)*100;
         tp_fp1(i,1) = (tp1/1000)*100;
         tp_fp2(i,2) = (summation2/30000)*100;
         tp_fp2(i,1) = (tp2/1000)*100;
     end

 %% fusion
 
    
end

