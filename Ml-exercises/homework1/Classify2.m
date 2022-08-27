function Classify2
file = xlsread('\default_features_1059_asli_unsorted.csv');
count1 = [];
count2 = [];
count3 = [];
count4 = [];
count5 = [];
count6 = [];
count7 = [];
count8 = [];
count9 = [];
count10= [];
count11= [];
count12= [];
count13= [];
count14= [];
count15= [];
count16= [];
count17= [];
count18= [];
count19= [];
count20= [];
count21= [];
count22= [];
count23= [];
count24= [];
count25= [];
count26= [];
count27= [];
count28= [];
count29= [];
count30= [];
count31= [];
count32= [];
count33= [];


for i = 1 : length(file(:,1))
    if file(i,69) == -15.75
        count1 = [count1 ; file(i,:)];
    elseif file(i,69) == 28.61
        count2 = [count2 ; file(i,:)];
    elseif file(i,69) == 33.66
        count3 = [count3 ; file(i,:)];
    elseif file(i,69) == 54.68
        count4 = [count4 ; file(i,:)];
    elseif file(i,69) == 44.41
        count5 = [count5 ; file(i,:)];
    elseif file(i,69) == 35.7
        count6 = [count6 ; file(i,:)];
    elseif file(i,69) == 39.91 && file(i,70) == 32.83
        count7 = [count7 ; file(i,:)];
    elseif file(i,69) == 39.91 && file(i,70) == 116.38
        count8 = [count8 ; file(i,:)];
    elseif file(i,69) == 19.75
        count9 = [count9 ; file(i,:)];
    elseif file(i,69) == 13.75
        count10 = [count10 ; file(i,:)];
    elseif file(i,69) == 17.98
        count11 = [count11 ; file(i,:)];
    elseif file(i,69) == 14.91
        count12 = [count12 ; file(i,:)];
    elseif file(i,69) == 35.68
        count13 = [count13 ; file(i,:)];
    elseif file(i,69) == 30.03
        count14 = [count14 ; file(i,:)];
    elseif file(i,69) == 42.86
        count15 = [count15 ; file(i,:)];
    elseif file(i,69) == -1.26
        count16 = [count16 ; file(i,:)];
    elseif file(i,69) == -6.17 && file(i,70) == 36.8
        count17 = [count17 ; file(i,:)];
    elseif file(i,69) == -6.17 && file(i,70) == 106.82
        count18 = [count18 ; file(i,:)];
    elseif file(i,69) == 17.25
        count19 = [count19 ; file(i,:)];
   elseif file(i,69) == 38
        count20 = [count20 ; file(i,:)];
    elseif file(i,69) == -35.3
        count21 = [count21 ; file(i,:)];
    elseif file(i,69) == 12.65
        count22 = [count22 ; file(i,:)];
    elseif file(i,69) == 35.7
        count23 = [count23 ; file(i,:)];
    elseif file(i,69) == 41.7
        count24 = [count24 ; file(i,:)];
    elseif file(i,69) == 11.55
        count25 = [count25 ; file(i,:)];
     elseif file(i,69) == 41.33 
        count26 = [count26 ; file(i,:)];
    elseif file(i,69) == 23.76 
        count27 = [count27 ; file(i,:)];
    elseif file(i,69) == 9.03
        count28 = [count28 ; file(i,:)];
    elseif file(i,69) == 34.03
        count29 = [count29 ; file(i,:)];
    elseif file(i,69) == 14.66
        count30 = [count30 ; file(i,:)];
    elseif file(i,69) == 52.5
        count31 = [count31 ; file(i,:)];
    elseif file(i,69) == 41.26
        count32 = [count32 ; file(i,:)];
    else 
        count33 = [count33 ; file(i,:)];
    
    end 
end

count1_train = count1(1:round(size(count1,1)*0.7),:);
count1_test = count1(round(size(count1,1)*0.7)+1:size(count1,1),:);      

count2_train = count2(1:round(size(count2,1)*0.7),:);
count2_test = count2(round(size(count2,1)*0.7)+1:size(count2,1),:); 

count3_train = count3(1:round(size(count3,1)*0.7),:);
count3_test = count3(round(size(count3,1)*0.7)+1:size(count3,1),:); 

count4_train = count4(1:round(size(count4,1)*0.7),:);
count4_test = count4(round(size(count4,1)*0.7)+1:size(count4,1),:); 

count5_train = count5(1:round(size(count5,1)*0.7),:);
count5_test = count5(round(size(count5,1)*0.7)+1:size(count5,1),:); 

count6_train = count6(1:round(size(count6,1)*0.7),:);
count6_test = count6(round(size(count6,1)*0.7)+1:size(count6,1),:);      

count7_train = count7(1:round(size(count7,1)*0.7),:);
count7_test = count7(round(size(count7,1)*0.7)+1:size(count7,1),:); 

count8_train = count8(1:round(size(count8,1)*0.7),:);
count8_test = count8(round(size(count8,1)*0.7)+1:size(count8,1),:); 

count9_train = count9(1:round(size(count9,1)*0.7),:);
count9_test = count9(round(size(count9,1)*0.7)+1:size(count9,1),:); 

count10_train = count10(1:round(size(count10,1)*0.7),:);
count10_test = count10(round(size(count10,1)*0.7)+1:size(count10,1),:);

count11_train = count11(1:round(size(count11,1)*0.7),:);
count11_test = count11(round(size(count11,1)*0.7)+1:size(count11,1),:);      

count12_train = count12(1:round(size(count12,1)*0.7),:);
count12_test = count12(round(size(count12,1)*0.7)+1:size(count12,1),:); 

count13_train = count13(1:round(size(count13,1)*0.7),:);
count13_test = count13(round(size(count13,1)*0.7)+1:size(count13,1),:); 

count14_train = count14(1:round(size(count14,1)*0.7),:);
count14_test = count14(round(size(count14,1)*0.7)+1:size(count14,1),:); 

count15_train = count15(1:round(size(count15,1)*0.7),:);
count15_test = count15(round(size(count15,1)*0.7)+1:size(count15,1),:);

count16_train = count16(1:round(size(count16,1)*0.7),:);
count16_test = count16(round(size(count16,1)*0.7)+1:size(count16,1),:);      

count17_train = count17(1:round(size(count17,1)*0.7),:);
count17_test = count17(round(size(count17,1)*0.7)+1:size(count17,1),:); 

count18_train = count18(1:round(size(count18,1)*0.7),:);
count18_test = count18(round(size(count18,1)*0.7)+1:size(count18,1),:); 

count19_train = count19(1:round(size(count19,1)*0.7),:);
count19_test = count19(round(size(count19,1)*0.7)+1:size(count19,1),:); 

count20_train = count20(1:round(size(count20,1)*0.7),:);
count20_test = count20(round(size(count20,1)*0.7)+1:size(count20,1),:);

count21_train = count21(1:round(size(count21,1)*0.7),:);
count21_test = count21(round(size(count21,1)*0.7)+1:size(count21,1),:);

count22_train = count22(1:round(size(count22,1)*0.7),:);
count22_test = count22(round(size(count22,1)*0.7)+1:size(count22,1),:); 

count23_train = count23(1:round(size(count23,1)*0.7),:);
count23_test = count23(round(size(count23,1)*0.7)+1:size(count23,1),:); 

count24_train = count24(1:round(size(count24,1)*0.7),:);
count24_test = count24(round(size(count24,1)*0.7)+1:size(count24,1),:); 

count25_train = count25(1:round(size(count25,1)*0.7),:);
count25_test = count25(round(size(count25,1)*0.7)+1:size(count25,1),:);

count26_train = count26(1:round(size(count26,1)*0.7),:);
count26_test = count26(round(size(count26,1)*0.7)+1:size(count26,1),:);      

count27_train = count27(1:round(size(count27,1)*0.7),:);
count27_test = count27(round(size(count27,1)*0.7)+1:size(count27,1),:); 

count28_train = count28(1:round(size(count28,1)*0.7),:);
count28_test = count28(round(size(count28,1)*0.7)+1:size(count28,1),:); 

count29_train = count29(1:round(size(count29,1)*0.7),:);
count29_test = count29(round(size(count29,1)*0.7)+1:size(count29,1),:); 

count30_train = count30(1:round(size(count30,1)*0.7),:);
count30_test = count30(round(size(count30,1)*0.7)+1:size(count30,1),:);

count31_train = count31(1:round(size(count31,1)*0.7),:);
count31_test = count31(round(size(count31,1)*0.7)+1:size(count31,1),:);      

count32_train = count32(1:round(size(count32,1)*0.7),:);
count32_test = count32(round(size(count32,1)*0.7)+1:size(count32,1),:); 

count33_train = count33(1:round(size(count33,1)*0.7),:);
count33_test = count33(round(size(count33,1)*0.7)+1:size(count33,1),:); 


train_set = [count1_train ; count2_train ; count3_train ; count4_train ; count5_train ; count6_train ; count7_train ; count8_train ; count9_train ; count10_train ; count11_train ; count12_train ; count13_train ; count14_train ; count15_train ; count16_train ; count17_train ; count18_train ; count19_train ; count20_train ; count21_train; count22_train ; count23_train ; count24_train ; count25_train ; count26_train ; count27_train ; count28_train ; count29_train ; count30_train ; count31_train ; count32_train ; count33_train ; ]
test_set = [count1_test ; count2_test ; count3_test ; count4_test ; count5_test ; count6_test ; count7_test ; count8_test ; count9_test; count10_test ; count11_test ; count12_test ; count13_test ; count14_test ; count15_test ; count16_test ; count17_test ; count18_test ; count19_test ; count20_test; count21_test; count22_test ; count23_test ; count24_test ; count25_test ; count26_test ; count27_test ; count28_test ; count29_test ; count30_test ; count31_test ; count32_test ; count33_test ; ];
group = train_set(:,71);


test_pro = [11, 21, 14, 10, 6, 9 , 19, 12, 7, 8, 7, 10, 7, 9, 8, 10, 7, 8, 3, 14, 4, 20, 6, 8, 4, 6, 7, 9, 10, 7, 10, 11, 15 ];
test_sample_num = 317;



[Class , err] = classify(test_set(:,1:end-3) , train_set(:,1:end-3) , group , 'diagquadratic'); % diaglinear , quadratic , diagquadratic

[c, order] = confusionmat(test_set(:, end), Class)



%%%%%%% calculation of TP Rate - FP Rate - Recall - Precesion - F-Measure %%%%%%%%%%%%%%%%%%%%%

tp = zeros([33 1]); 
fp = zeros([33 1]); 
fn = zeros([33 1]);
tn = zeros([33 1]);
result = zeros([34 5]); 

for n = 1:33
    tp(n,1) = c(n,n);
   
end
tp

for n = 1:33
    for m = 1:33
        if( m ~= n)
           fn(n,1) = fn(n,1)+c(n,m);
    
        end
    end 
end
fn


for n = 1:33
    for m = 1:33
        if( m ~= n)
           fp(n,1) = fp(n,1)+c(m,n);
    
        end
    end
    tn(n,1)= test_sample_num - (tp(n,1)+ fn(n,1)+ fp(n,1)); 
end
fp
tn

%%%%%%%%%%%%%% columns of result is tp_rate , fp_rate ,precision , recall and F_Measure %%%%%%%%%%%%% 
for n = 1:33
    result(n,1)= tp(n,1)/(tp(n,1) + fn(n,1));	%%tp
    result(n,2)= fp(n,1)/(fp(n,1) + tn(n,1));   %%fp
    result(n,3) = tp(n,1)/(tp(n,1) + fp(n,1));  %%precision
    result(n,4) = tp(n,1) /(tp(n,1) + fn(n,1)); %%recall
    result(n,5) = 2*(result(n,3)*result(n,4))/(result(n,3)+result(n,4));    %%f-measure
   
    if (isnan(result(n,1))) result(n,1) = 0;
    end
    if (isnan(result(n,2))) result(n,2) = 0;
    end   
    if (isnan(result(n,3))) result(n,3) = 0;
    end   
    if (isnan(result(n,4))) result(n,4) = 0;
    end   
    if (isnan(result(n,5))) result(n,5) = 0;
    end
end

%%%%%%%%%%%%%%%%% last row of result  = average of all classes

sum =0
for n = 1:5
    for m = 1:33
        
    sum = sum + result(m,n);
    end
    result(34,n)= sum/33 ;
    sum =0;
end
result


%%test_data = test_set(:,end);
%%csvwrite('\test_set.csv',test_data);




end

