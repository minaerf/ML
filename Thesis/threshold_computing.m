function [ threshold ] = threshold_computing( mdl, test_label, dec_values, predicted_label, cls )
 Detailed explanation goes here

threshold = zeros(size(cls,1),1); % threshold
cpv = zeros(50,size(cls,1));  %correct_predicted dec_values for each instances of each class
ncpv = zeros(50,size(cls,1)); %non_correct_predicted dec_values for each instances in each class
cpv_counter = zeros(size(cls,1),1);
ncpv_counter = zeros(size(cls,1),1);

for i = 1:size(test_label,1)
    if predicted_label(i,1) == test_label(i,1)
        for j = 1:size(cls,1)
            if predicted_label(i,1) == cls(j)
                cpv_counter(j,1) = cpv_counter(j,1) + 1;
                cpv(cpv_counter(j,1),j) = dec_values(i,j);
            end
        end
    else
        for j = 1:size(cls,1)
            if predicted_label(i,1) == cls(j)
                ncpv_counter(j,1) = ncpv_counter(j,1) + 1;
                ncpv(ncpv_counter(j,1),j) = dec_values(i,j);
            end
        end
    end
end
    



end

