file = csvread ('\default_features_1059_asli_withoutlabel.csv');
data = file(:,1:68);


%% the first column of PCA
[COEFF,SCORE] = princomp(data);
Data = SCORE(:,1);


% width = the bin length , u=width-default = 0.6

figure;
[f,x,u] = ksdensity(Data);
plot(x,f)
hold on 
[f,x] = ksdensity(Data , 'width' , u/3 );
plot(x,f,'r')
[f,x] = ksdensity(Data , 'width' , u*3 );
plot(x,f,'g')
legend('default width' , 'defult/3' ,'3* default');


