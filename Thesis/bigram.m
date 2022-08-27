function bigram

%calculating byte_frequencies in terms of bigram



load('\dataset\corpus\sample1\filenames.mat');
bi_byte_ferequency = zeros(1000, 65536);
type = {'.txt', '.xml', '.xls', '.wmv', '.tif', '.ps', '.ppt', '.mp4', '.mp3', '.m4a', '.log', '.json', '.js', '.jpg', '.java', '.html', '.gif', '.flv', '.doc', '.csv', '.css', '.bz2', '.bmp', '.avi', '.pdf','.docx', '.gz', '.png', '.pptx', '.xlsx', '.zip'};
typeAddress = {'\dataset\final_dataset\txt\fragments','\dataset\final_dataset\xml\fragments','\dataset\final_dataset\xls\fragments','\dataset\final_dataset\wmv\fragments','\dataset\final_dataset\tif\fragments','\dataset\final_dataset\ps\fragments','\dataset\final_dataset\ppt\fragments','\dataset\final_dataset\mp4\fragments','\dataset\final_dataset\mp3\fragments','\dataset\final_dataset\m4a\fragments','\dataset\final_dataset\log\fragments','\dataset\final_dataset\json\fragments','\dataset\final_dataset\js\fragments','\dataset\final_dataset\jpg\fragments','\dataset\final_dataset\java\fragments','\dataset\final_dataset\html\fragments','\dataset\final_dataset\gif\fragments','\dataset\final_dataset\flv\fragments','\dataset\final_dataset\doc\fragments','\dataset\final_dataset\csv\fragments','\dataset\final_dataset\css\fragments','\dataset\final_dataset\bz2\fragments','\dataset\final_dataset\avi\fragments','\dataset\final_dataset\pdf\fragments','\dataset\final_dataset\docx\fragments','\dataset\final_dataset\gz\fragments','\dataset\final_dataset\png\fragments','\dataset\final_dataset\pptx\fragments','\dataset\final_dataset\xlsx\fragments','\dataset\final_dataset\zip\fragments' };


for i = 0:30999

    file_name = strcat(typeAddress{floor(i/1000)+1}, '\', int2str(filenames(mod(i,1000)+1,1,floor(i/1000)+1)), type{floor(i/1000)+1}, '.txt')
    fid = fopen(file_name, 'r');
    fseek(fid, 1, 'bof');
    A = fread(fid, inf, 'uint16');
    fclose(fid);

    fid = fopen(file_name, 'r');
    B = fread(fid, inf, 'uint16');
    fclose(fid);


    D = [A;B];


    for counter = 1: size(D)                                   
        for j = 1:65536
            if D(counter) == j-1
                bi_byte_ferequency(i+1,j) = bi_byte_ferequency(i+1,j) + 1/511;
                break               
            end
        end
    end

end

  

save('\dataset\corpus\sample1\bi_ferequencies.mat', 'bi_byte_ferequency', '-v7.3');


end

