file = csvread ('\default_features_1059_asli_withoutlabel.csv');
data = file(:,1:68);


%% the first column of PCA
[COEFF,SCORE] = princomp(data);
Data = SCORE(:,1);

%%number of bins in histogram

nbins = 100;
hist(Data,nbins);
