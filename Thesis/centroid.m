function centroid

centroid = zeros(10,65792);
max_stdev = zeros(10,65792);
min_stdev = zeros(10,65792);

load('E:\mina\normalized_bi_uni_byte_ferequency.mat');


for j = 1:65792
    for i = 1:10000
        temp = normalized_bi_uni_byte_ferequency(i,j); 
        centroid(floor((i-1)/1000)+1, j) = centroid(floor((i-1)/1000)+1, j) + temp/1000;
    end       
end

for j = 1:65792
    for i = 1:10000
        temp = normalized_bi_uni_byte_ferequency(i,j); 
        max = abs(centroid(floor((i-1)/1000)+1, j)-temp);
        min = abs(centroid(floor((i-1)/1000)+1, j)-temp);
        if max > max_stdev(floor((i-1)/1000)+1, j)
            max_stdev(floor((i-1)/1000)+1, j) = max;
        end
        if min < min_stdev(floor((i-1)/1000)+1, j)
            min_stdev(floor((i-1)/1000)+1, j) = min;
        end
    end       
end

save('E:\mina\centroids\centroid.mat' , 'centroid', '-v7.3'); 
save('E:\mina\centroids\max_stdev.mat' , 'max_stdev', '-v7.3'); 
save('E:\mina\centroids\min_stdev.mat' , 'min_stdev', '-v7.3'); 


end

