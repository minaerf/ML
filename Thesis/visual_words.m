function visual_words()


%% kfold creation with k=10

    for fold = 1:10

        idx_train = 1;
        idx_test = 1;
        train_set_pix_vec = zeros(14284800,5);
        test_set_pix_vec = zeros(1587200,5);
        counter = 1;

        for j = 1:512:15872000
            if(counter <= 27900)
                if trIdx(fold,counter) == test(j,4)
                    train_set_pix_vec(idx_train:idx_train+511,:) = test(j:j+511,:);
                    idx_train = idx_train + 512;
                    counter = counter + 1;
                else
                    test_set_pix_vec(idx_test:idx_test+511,:) = test(j:j+511,:);
                    idx_test = idx_test + 512;
                end
            end
        end

        train_label = train_set_pix_vec(:,end);
        train_set_pix_vec = train_set_pix_vec(:,1:end-2);
        test_label = test_set_pix_vec(:,end);
        test_set_pix_vec = test_set_pix_vec(:,1:end-2);

        save(strcat('\512byte\fold', num2str(fold), '\for_clustring\train_set_pix_vec.mat'), 'train_set_pix_vec', '-v7.3');
        save(strcat('\512byte\fold', num2str(fold), '\for_clustring\train_label.mat'), 'train_label', '-v7.3');
        save(strcat('\512byte\fold', num2str(fold), '\for_clustring\test_set_pix_vec.mat'), 'test_set_pix_vec', '-v7.3');
        save(strcat('\512bytte\fold', num2str(fold), '\for_clustring\test_label.mat'), 'test_label', '-v7.3');



 %% preparing sets for creating clusters (for finding visual words in each fold)

        
        load(strcat('\512byte\fold', num2str(fold), '\for_clustring\train_set_pix_vec.mat'));
        load(strcat('\512byte\fold', num2str(fold), '\for_clustring\test_set_pix_vec.mat'));
        
        id = zeros(14284800,1);
        for i = 1:14284800
            id(i,1) = i;
        end

        train_set_pix_vec = [train_set_pix_vec,id];
        shuffeled_train_set = train_set_pix_vec(randperm(size(train_set_pix_vec,1)),:);
        shuffeled_train_set_id = shuffeled_train_set(:,end);
        shuffeled_train_set = shuffeled_train_set(:,1:end-1);

        id = zeros(1587200,1);
        for i = 1:1587200
            id(i,1) = i;
        end

        test_set_pix_vec = [test_set_pix_vec,id];
        shuffeled_test_set = test_set_pix_vec(randperm(size(test_set_pix_vec,1)),:);
        shuffeled_test_set_id = shuffeled_test_set(:,end);
        shuffeled_test_set = shuffeled_test_set(:,1:end-1);

        save(strcat('\512byte\fold', num2str(fold), '\for_clustring\shuffeled_train_set.mat'), 'shuffeled_train_set', '-v7.3');
        save(strcat('\512byte\fold', num2str(fold), '\for_clustring\shuffeled_train_set_id.mat'), 'shuffeled_train_set_id', '-v7.3');
        save(strcat('\512byte\fold', num2str(fold), '\for_clustring\shuffeled_test_set.mat'), 'shuffeled_test_set', '-v7.3');
        save(strcat('\512byte\fold', num2str(fold), '\for_clustring\shuffeled_test_set_id.mat'), 'shuffeled_test_set_id', '-v7.3');



    end
    
    
%% final dataset 

    train_set = zeros(27900,512);
    counter = 0;
    col = 1;
    idx_train = [idx_train,shuffeled_train_set_id];
    idx_train = sortrows(idx_train,2);
    for i = 1:14284800
        if rem(i-1, 512) == 0
            counter = counter + 1;
            col = 1;
        end
        
        train_set(counter,col) = idx_train(i,1);
        col = col + 1;
    end
    
    
    train_freq = zeros(27900,160000);
    for i = 1:27900
        w = zeros(400,400);
        for j = 1:511
            a = train_set(i,j)+1;
            b = train_set(i,j+1)+1;
            w(a,b) = w(a,b) + 1;
            train_freq(i, (400*(a-1) + b)) = train_freq(i, (400*(a-1) + b)) + 1;
        end
    end
    
    
    train_uni_freq = zeros(27900,400);
    
    for i = 1:27900
        for j = 1:512
            train_uni_freq(i, train_set(i,j)+1) = train_uni_freq(i, train_set(i,j)+1) + 1;
        end
    end
    
    
    test_set = zeros(3100,512);
    counter = 0;
    col = 1;
    idx_test = [idx_test,shuffeled_test_set_id];
    idx_test = sortrows(idx_test,2);
    for i = 1:1587200
        if rem(i-1, 512) == 0
            counter = counter + 1;
            col = 1;
        end
        
        test_set(counter,col) = idx_test(i,1);
        col = col + 1;
    end
    
    
    test_freq = zeros(3100,160000);
    for i = 1:3100
        w = zeros(400,400);
        for j = 1:511
            a = test_set(i,j)+1;
            b = test_set(i,j+1)+1;
            w(a,b) = w(a,b) + 1;
            test_freq(i, (400*(a-1) + b)) = test_freq(i, (400*(a-1) + b)) + 1;
        end
    end
    
    
    test_uni_freq = zeros(3100,400);
    
    for i = 1:3100
        for j = 1:512
            test_uni_freq(i, test_set(i,j)+1) = test_uni_freq(i, test_set(i,j)+1) + 1;
        end
    end
    
    
    counter = 0;
    for i = 1:1587200
        if rem(i-1, 512) == 0
            counter = counter + 1;
        end
        test_label(counter,1) = telabel(i,1);
    end
    
    counter = 0;
    for i = 1:14284800
        if rem(i-1, 512) == 0
            counter = counter + 1;
        end
        train_label(counter,1) = trlabel(i,1);
    end
    
    test_set = [test_uni_freq, test_freq];
    train_set = [train_uni_freq, train_freq];
    
    save(strcat('\512byte\fold', num2str(fold), '\final\train_set.mat'), 'train_set', '-v7.3');
        save(strcat('\512byte\fold', num2str(fold), '\final\train_label.mat'), 'train_label', '-v7.3');
        save(strcat('\512byte\fold', num2str(fold), '\final\test_set.mat'), 'test_set', '-v7.3');
        save(strcat('\512byte\fold', num2str(fold), '\final\test_label.mat'), 'test_label', '-v7.3');



 %% model
 
 predicted_label = zeros(3100, 10);
 accuracy = zeros(3,10);
 tp_fp = zeros(31,1);
 conf_matrix = zeros(31,31);
 
        for fold = 1:10   
            
            load(strcat('\512byte\fold', num2str(fold), '\final\test_label.mat'));
            load(strcat('\512byte\fold', num2str(fold), '\final\train_label.mat'));
            load(strcat('\512byte\fold', num2str(fold), '\final\train_set.mat'));
            load(strcat('\512byte\fold', num2str(fold), '\final\test_set.mat'));
            
            zero_features = any(train_set,1);
            train_set = train_set(:, zero_features);
            test_set = test_set(:, zero_features);
            
            model = train(train_label, sparse(train_set), '-s 1 -c 0.001 -q');
            [p_label, accuracy1, prob] = predict(test_label, sparse(test_set), model, '-b 1');
            predicted_label(:,fold) = p_label;
            accuracy(:,fold) = accuracy1;
            for j = 1:size(p_label,1)
                pl = p_label(j,1);
                conf_matrix(test_label(j,1),pl) =  conf_matrix(test_label(j,1),pl) + 1;
            end
            save(strcat('\512byte\fold', num2str(fold), '\final\results\model.mat'), 'model', '-v7.3');
            save(strcat('\512byte\fold', num2str(fold), '\final\results\prob.mat'), 'prob', '-v7.3');
            save(strcat('\512byte\fold', num2str(fold), '\final\results\final_train_set.mat'), 'train_set', '-v7.3');
            save(strcat('\512byte\fold', num2str(fold), '\final\results\final_test_set.mat'), 'test_set', '-v7.3');
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

