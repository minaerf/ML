test_label = zeros(3100,10);
mean_p = zeros(31,1);
dev_p = zeros(31,1);
sum_for_mean = zeros(31,1);
sum_for_dev = zeros(31,1);
fp_counter = zeros(31,1);


for i = 1:10    
    test_label(:,i) = shuffeled_labels(teIdx(i,:),end);
end

%% threshold calculation

for i = 2:10
    for j = 1:3100
        if predicted_label(j,i)~=test_label(j,i)
            probability = max(prob(j,:,i-1));
            fp_counter(predicted_label(j,i),1) = fp_counter(predicted_label(j,i),1) + 1;
            sum_for_mean(predicted_label(j,i),1) = sum_for_mean(predicted_label(j,i),1) + probability;
        end
    end
end

for i = 1:31
    mean_p(i,1) = sum_for_mean(i,1)/fp_counter(i,1);
end

for i = 2:10
    for j = 1:3100
        if predicted_label(j,i)~=test_label(j,i)
            dev_probability = ( max(prob(j,:,i-1))-mean_p(predicted_label(j,i)) ) * ( max(prob(j,:,i-1))-mean_p(predicted_label(j,i)) ) ;
            sum_for_dev(predicted_label(j,i),1) = sum_for_dev(predicted_label(j,i),1) + dev_probability;
        end
    end
end
    

for i = 1:31
    dev_p(i,1) = sum_for_dev(i,1)/fp_counter(i,1);
end

%% reducing fp

thresholds = zeros(31,2);
alpha = 0.5;
unknown = zeros(31,1);
valid_predicted_label = zeros(3100,1);
conf_matrix = zeros(32,32);
tp_fp = zeros(31,2);
class_num = zeros(31,3);

for i = 1:31
    thresholds(i,1) = (mean_p(i,1) - dev_p(i,1)*alpha);
    thresholds(i,2) = (mean_p(i,1) + dev_p(i,1)*alpha);
end

for j = 1:3100
    pl = predicted_label(j,1);
    if pl == 4 || pl == 14 || pl == 22 || pl ==24 || pl ==26 || pl == 27 || pl ==28 || pl == 29 || pl==31 || pl == 17 
        if  max(prob1(j,:))<=thresholds(pl,1) 
            valid_predicted_label(j,1) = 32;
            unknown(pl,1) = unknown(pl,1) + 1;
        else
            valid_predicted_label(j,1) = pl;
        end
    else
        valid_predicted_label(j,1) = pl;
    end
    conf_matrix(test_label(j,1),valid_predicted_label(j,1)) = conf_matrix(test_label(j,1),valid_predicted_label(j,1)) + 1;
end


for i = 1:3100
    temp = test_label(i,1);
    class_num(temp,1) = class_num(temp,1) + 1;
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
    tp_fp(i,2) = (summation/(3100-class_num(i,1)))*100;
    tp_fp(i,1) = (tp/class_num(i,1))*100;
end

