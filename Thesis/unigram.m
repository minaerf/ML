function unigram

%calculating byte_frequencies in terms of unigram

byte_ferequency = zeros(31000,256);
filenames = zeros(1000,1,31);
typeRange = {59312,21269,26307,28764,13092,27168,48262,21460,86211,28711,36120,18026,12729,22003,13005,18340,24123,41393,33129,13794,9906,20148,58640,27934,173325,37404,55180,77300,50438,26856,28074};
type = {'.txt', '.xml', '.xls', '.wmv', '.tif', '.ps', '.ppt', '.mp4', '.mp3', '.m4a', '.log', '.json', '.js', '.jpg', '.java', '.html', '.gif', '.flv', '.doc', '.csv', '.css', '.bz2', '.bmp', '.avi', '.pdf','.docx', '.gz', '.png', '.pptx', '.xlsx', '.zip'};
typeAddress = {'\dataset\final_dataset\txt\fragments','\dataset\final_dataset\xml\fragments','\dataset\final_dataset\xls\fragments','\dataset\final_dataset\wmv\fragments','\dataset\final_dataset\tif\fragments','\dataset\final_dataset\ps\fragments','\dataset\final_dataset\ppt\fragments','\dataset\final_dataset\mp4\fragments','\dataset\final_dataset\mp3\fragments','\dataset\final_dataset\m4a\fragments','\dataset\final_dataset\log\fragments','\dataset\final_dataset\json\fragments','\dataset\final_dataset\js\fragments','\dataset\final_dataset\jpg\fragments','\dataset\final_dataset\java\fragments','\dataset\final_dataset\html\fragments','\dataset\final_dataset\gif\fragments','\dataset\final_dataset\flv\fragments','\dataset\final_dataset\doc\fragments','\dataset\final_dataset\csv\fragments','\dataset\final_dataset\css\fragments','\dataset\final_dataset\bz2\fragments','\dataset\final_dataset\bmp\fragments','\dataset\final_dataset\avi\fragments','\dataset\final_dataset\pdf\fragments','\dataset\final_dataset\docx\fragments','\dataset\final_dataset\gz\fragments','\dataset\final_dataset\png\fragments','\dataset\final_dataset\pptx\fragments','\dataset\final_dataset\xlsx\fragments','\dataset\final_dataset\zip\fragments' };

for m = 1:31
    for i = 1:1000

        a = 1;
        b = cell2mat(typeRange(m));
        randNum = (b-a).*rand(1,1) + a;

        name = int64(randNum);
        file_name = strcat(typeAddress{m}, '\', int2str(name), type{m}, '.txt');
        file_existance = exist(file_name, 'file');

        while file_existance == 0
            randNum = (b-a).*rand(1,1) + a;
            name = int64(randNum);
            file_name = strcat(typeAddress{m}, '\', int2str(name), type{m}, '.txt');
            file_existance = exist(file_name, 'file'); 
        end

        if i >= 2
            for count = 1:i-1
                index = find(filenames(1:i-1,1,m)==name);
                while isempty(index)==0 || file_existance == 0
                     randNum = (b-a).*rand(1,1) + a;
                     name = int64(randNum);
                     file_name = strcat(typeAddress{m}, '\', int2str(name), type{m}, '.txt');
                     file_existance = exist(file_name, 'file');
                     index = find(filenames(1:i-1,1,m)==name);
                end
            end
        end


        file_name
        filenames(i,1,m) = name;
        fid = fopen(file_name, 'r');
        A = fread(fid, inf, 'uint8');
        fclose(fid);



        for counter = 1: size(A)            

            for j = 1:256
                if A(counter) == j-1
                    byte_ferequency(i+(m-1)*1000,j) = byte_ferequency(i+(m-1)*1000,j) + 1/512;
                    break               
                end
            end
            
        end 

    end

end

save('\dataset\corpus\sample1\filenames_.mat', 'filenames');
save('\dataset\corpus\sample1\uni_ferequencies_.mat', 'byte_ferequency', '-v7.3');


end

