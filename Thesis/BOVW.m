function [bovw_dataset,value] = BOVW

%load('4kbytes\filenames.mat')
load('\dataset\corpus\sample\filenames.mat')
type = {'.txt', '.xml', '.xls', '.wmv', '.tif', '.ps', '.ppt', '.mp4', '.mp3', '.m4a', '.log', '.json', '.js', '.jpg', '.java', '.html', '.gif', '.flv', '.doc', '.csv', '.css', '.bz2', '.bmp', '.avi', '.pdf','.docx', '.gz', '.png', '.pptx', '.xlsx', '.zip'};
typeAddress = {'final_dataset\txt\sample4','final_dataset\xml\sample4','final_dataset\xls\sample4','final_dataset\wmv\sample4','final_dataset\tif\sample4','final_dataset\ps\sample4','final_dataset\ppt\sample4','final_dataset\mp4\sample4','final_dataset\mp3\sample4','final_dataset\m4a\sample4','final_dataset\log\sample4','final_dataset\json\sample4','final_dataset\js\sample4','final_dataset\jpg\sample4','final_dataset\java\sample4','final_dataset\html\sample4','final_dataset\gif\sample4','final_dataset\flv\sample4','final_dataset\doc\sample4','final_dataset\csv\sample4','final_dataset\css\sample4','final_dataset\bz2\sample4','final_dataset\bmp\sample4','final_dataset\avi\sample4','final_dataset\pdf\sample4','final_dataset\docx\sample4','final_dataset\gz\sample4','final_dataset\png\sample4','final_dataset\pptx\sample4','final_dataset\xlsx\sample4','final_dataset\zip\sample4' };
%typeAddress = {'final_dataset\txt\sample1','final_dataset\xml\sample1','final_dataset\xls\sample1','final_dataset\wmv\sample1','final_dataset\tif\sample1','final_dataset\ps\sample1','final_dataset\ppt\sample1','final_dataset\mp4\sample1','final_dataset\mp3\sample1','final_dataset\m4a\sample1','final_dataset\log\sample1','final_dataset\json\sample1','final_dataset\js\sample1','final_dataset\jpg\sample1','final_dataset\java\sample1','final_dataset\html\sample1','final_dataset\gif\sample1','final_dataset\flv\sample1','final_dataset\doc\sample1','final_dataset\csv\sample1','final_dataset\css\sample1','final_dataset\bz2\sample1','final_dataset\bmp\sample1','final_dataset\avi\sample1',final_dataset\pdf\sample1','final_dataset\docx\sample1','final_dataset\gz\sample1','final_dataset\png\sample1','final_dataset\pptx\sample1','final_dataset\xlsx\sample1','final_dataset\zip\sample1' };



bovw_dataset = zeros(15872000,22);
value = zeros(15872000,1);


for radius = 1:3
    lin = 0;
    for num = 1:31000
        filename = strcat(typeAddress{floor((num-1)/1000)+1}, '\', int2str(filenames(mod(num-1,1000)+1,1,floor((num-1)/1000)+1)), type{floor((num-1)/1000)+1}, '.txt')
        
        fid = fopen(filename, 'r');
        A = fread(fid, inf, 'uint8=>uint8');
        fclose(fid);
        height = 1;
        pixelMatrix = vec2mat(A,height);
        [assin, dist, strength] = CN_GrauRedeRaioTextura_Norm2(double(pixelMatrix),1,radius);
        
        for i = 1:512
            lin = lin + 1;
            if radius == 2
                col = 22;
            elseif radius == 3
                col = 44;
            else
                col = 0;
                value(lin,1) = A(i,1);
            end
            for j = 1:size(assin,1)
                col = col + 1;
                bovw_dataset(lin,col) = assin(j,i); %degree
                col = col + 1;
                bovw_dataset(lin,col) = strength(j,i);  %strength
            end
        end
       
    end
    
end

end
