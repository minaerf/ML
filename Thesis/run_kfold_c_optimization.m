function run_kfold_c_optimization

source = '\dataset\corpus\sample\fold';
str = '\multiclass-result-withKernel\c';

c = [0,1,2,3,4,5,6,7,8];

for ccount = 1:size(c,2)
    for f = 1:10 %10fold
        fold_address = strcat(source, num2str(f), '\');
        load(strcat(fold_address, 'train_set.mat'));
        load(strcat(fold_address, 'train_label.mat'));
        load(strcat(fold_address, 'test_set.mat'));
        load(strcat(fold_address, 'test_label.mat'));
        load(strcat(fold_address, 'meaning_score.mat'));
        load(strcat(fold_address, 'sorted_score.mat'));
        load(strcat(fold_address, 'sorted_score_index.mat'));

        selected_features = zeros(size(train_set,1)+1,100);
        threshold = zeros(12,1);
        for i = 1:12
            threshold(i,1) = size(find(sorted_score(i,:) > 0),2);  % srted_score(i) = scoes for filetype i
        end
        l = 1;
        for m = 1:12
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
        for m = 1:12
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

        M = zeros(12,size(test_set,2));
        for i = 1:size(test_set,2)
            index = test_set(end,i);
            M(1:12,i) = meaning_score(1:12,index);
        end
        M = M';

        test_set = test_set(1:end-1,:);
        train_set = train_set(1:end-1,:);

        kernel = @(X,Y) (X*M*M'*Y);
        numTrain = size(train_set,1);
        numTest = size(test_set,1);
        K =  [ (1:numTrain)' , kernel(train_set,train_set') ];
        KK = [ (1:numTest)'  , kernel(test_set,train_set')  ];
        log2c = c(ccount);
        cmd = ['-t 4 -q -c ', num2str(2^log2c)];
        model = svmtrain(train_label, K, cmd);
        [predicted_label, accuracy, prob_estimates] = svmpredict(test_label, KK, model);
        conf = confusionmat(predicted_label, test_label);

       save(strcat(source, num2str(f), str, num2str(c(ccount)), '\predicted_label.mat') , 'predicted_label', '-v7.3');
        save(strcat(source, num2str(f), str, num2str(c(ccount)), '\accuracy.mat'), 'accuracy', '-v7.3');
        save(strcat(source, num2str(f), str, num2str(c(ccount)), '\model.mat'), 'model', '-v7.3');
        save(strcat(source, num2str(f), str, num2str(c(ccount)), '\conf.mat'), 'conf', '-v7.3');
        
    end
end

end

