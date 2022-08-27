function randomSelect20()
file = xlsread('\default_features_1059_attr53End.csv');
miss = (20*length(file(:,1)))/100;
length(file(:,1))
mat = zeros(length(file(:,1)),1);
for i = 1 : miss
r = floor(1 + rand()*length(file(:,1)));
while(1)
if(mat(r,1) ==1)
r = floor(1 + rand()*length(file(:,1)));
else
break;
end
end
mat(r,1) = 1;
file(r,70) = NaN;
end
csvwrite('\default_features_1059_tracks_20miss.csv' , file);
end

