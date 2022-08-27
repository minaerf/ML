
file = xlsread('\default_features_1059_tracks-INTLABEL.csv');
cluster = zeros(length(file(:,1)),1);
mainLabel = file(:,71);
dataset = file(:,1:68);
Result = zeros(5,5);
%%for t = 1 : 50
[center,U,obj] = fcm(dataset,5);
U = transpose(U);


    for i=1 : length(U(:,1))
     Max_Row = max(U(i,:));
     for j=1 : length(U(1,:))
        if U(i,j)== Max_Row
         cluster(i,1) = j;
         break
        end
    
    end
    end

compare = [mainLabel,cluster ];
    
    for i=1 : length(U(:,1))
        row_index = compare(i,1);
        Column_index = compare(i,2);
       
        Result(row_index , Column_index) = Result(row_index , Column_index)+1; 
        
    end 
        
    
    

Result
    
