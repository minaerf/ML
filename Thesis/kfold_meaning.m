function kfold_meaning(train_set, train_label,fold)

class_num = zeros(31,1);
for i = 1:size(train_label,1)
    if train_label(i,1) == 1
        class_num(1,1) = class_num(1,1) + 1;
    elseif train_label(i,1) == 2
        class_num(2,1) = class_num(2,1) + 1;
    elseif train_label(i,1) == 3
        class_num(3,1) = class_num(3,1) + 1;
    elseif train_label(i,1) == 4
        class_num(4,1) = class_num(4,1) + 1;
    elseif train_label(i,1) == 5
        class_num(5,1) = class_num(5,1) + 1;
    elseif train_label(i,1) == 6
        class_num(6,1) = class_num(6,1) + 1;
    elseif train_label(i,1) == 7
        class_num(7,1) = class_num(7,1) + 1;
    elseif train_label(i,1) == 8
        class_num(8,1) = class_num(8,1)+ 1;
    elseif train_label(i,1) == 9
        class_num(9,1) = class_num(9,1) + 1;
    elseif train_label(i,1) == 10
        class_num(10,1) = class_num(10,1) + 1;
    elseif train_label(i,1) == 11
        class_num(11,1) = class_num(11,1) + 1;
    elseif train_label(i,1) == 12
        class_num(12,1) = class_num(12,1) + 1;
    elseif train_label(i,1) == 13
        class_num(13,1) = class_num(13,1) + 1;
    elseif train_label(i,1) == 14
        class_num(14,1) = class_num(14,1) + 1;
    elseif train_label(i,1) == 15
        class_num(15,1) = class_num(15,1) + 1;
    elseif train_label(i,1) == 16
        class_num(16,1) = class_num(16,1) + 1;
    elseif train_label(i,1) == 17
        class_num(17,1) = class_num(17,1) + 1;
    elseif train_label(i,1) == 18
        class_num(18,1) = class_num(18,1) + 1;
    elseif train_label(i,1) == 19
        class_num(19,1) = class_num(19,1)+ 1;
    elseif train_label(i,1) == 20
        class_num(20,1) = class_num(20,1) + 1;
    elseif train_label(i,1) == 21
        class_num(21,1) = class_num(21,1) + 1;
    elseif train_label(i,1) == 22
        class_num(22,1) = class_num(22,1) + 1;
    elseif train_label(i,1) == 23
        class_num(23,1) = class_num(23,1) + 1;
    elseif train_label(i,1) == 24
        class_num(24,1) = class_num(24,1) + 1;
    elseif train_label(i,1) == 25
        class_num(25,1) = class_num(25,1) + 1;
    elseif train_label(i,1) == 26
        class_num(26,1) = class_num(26,1) + 1;
    elseif train_label(i,1) == 27
        class_num(27,1) = class_num(27,1) + 1;
    elseif train_label(i,1) == 28
        class_num(28,1) = class_num(28,1)+ 1;
    elseif train_label(i,1) == 29
        class_num(29,1) = class_num(29,1) + 1;
    elseif train_label(i,1) == 30
        class_num(30,1) = class_num(30,1) + 1;
    elseif train_label(i,1) == 31
        class_num(31,1) = class_num(31,1) + 1;
    end
end



meaning_score = zeros(31,65792);
sorted_score = zeros(31,65792);
sorted_score_index = zeros(31,65792);
k = zeros(1,65792);     %feature w appears k times in the dataset
m = zeros(31,65792);    %feature w appears m times in the documents of class c
L = 512*27900;	% dataset length, B=511*30000 for bi_byte and B = 511*30000 for uni_byte
%B = 512*900;        %class length, B=511*1000 for bi_byte and B = 512*1000 for uni_byte
%N = L/B;        %number of documents
N = zeros(31,1);

for i = 1:31
    N(i,1) = L/(class_num(i,1)*512);
end

for j = 1:65792
    for i = 1:27900
        if train_set(i,j) == 0
        continue;
        else
            if j<=256
                temp = train_set(i,j) * 512;
            else
                temp = train_set(i,j) * 511;
            end
            k(1,j) = k(1,j) + temp;
            if train_label(i,1) == 1
                m(1,j) = m(1,j) + temp;
            elseif train_label(i,1) == 2
                m(2,j) = m(2,j) + temp;
            elseif train_label(i,1) == 3
                m(3,j) = m(3,j) + temp;
            elseif train_label(i,1) == 4
                m(4,j) = m(4,j) + temp;
            elseif train_label(i,1) == 5
                m(5,j) = m(5,j) + temp;
            elseif train_label(i,1) == 6
                m(6,j) = m(6,j) + temp;
            elseif train_label(i,1) == 7
                m(7,j) = m(7,j) + temp;
            elseif train_label(i,1) == 8
                m(8,j) = m(8,j) + temp;
            elseif train_label(i,1) == 9
                m(9,j) = m(9,j) + temp;
            elseif train_label(i,1) == 10
                m(10,j) = m(10,j) + temp;
            elseif train_label(i,1) == 11
                m(11,j) = m(11,j) + temp;
            elseif train_label(i,1) == 12
                m(12,j) = m(12,j) + temp;
            elseif train_label(i,1) == 13
                m(13,j) = m(13,j) + temp;
            elseif train_label(i,1) == 14
                m(14,j) = m(14,j) + temp;
            elseif train_label(i,1) == 15
                m(15,j) = m(15,j) + temp;
            elseif train_label(i,1) == 16
                m(16,j) = m(16,j) + temp;
            elseif train_label(i,1) == 17
                m(17,j) = m(17,j) + temp;
            elseif train_label(i,1) == 18
                m(18,j) = m(18,j) + temp;
            elseif train_label(i,1) == 19
                m(19,j) = m(19,j) + temp;
            elseif train_label(i,1) == 20
                m(20,j) = m(20,j) + temp;
            elseif train_label(i,1) == 21
                m(21,j) = m(21,j) + temp;
            elseif train_label(i,1) == 22
                m(22,j) = m(22,j) + temp;
            elseif train_label(i,1) == 23
                m(23,j) = m(23,j) + temp;
            elseif train_label(i,1) == 24
                m(24,j) = m(24,j) + temp;
            elseif train_label(i,1) == 25
                m(25,j) = m(25,j) + temp;
            elseif train_label(i,1) == 26
                m(26,j) = m(26,j) + temp;
            elseif train_label(i,1) == 27
                m(27,j) = m(27,j) + temp;
            elseif train_label(i,1) == 28
                m(28,j) = m(28,j) + temp;
            elseif train_label(i,1) == 29
                m(29,j) = m(29,j) + temp;
            elseif train_label(i,1) == 30
                m(30,j) = m(30,j) + temp;
            elseif train_label(i,1) == 31
                m(31,j) = m(31,j) + temp;
            end
        end
    end
end


for i = 1:31
    for j = 1:65792
        if m(i,j) == 1
            meaning_score(i, j) = 0;
        else
            temp = gammaln(k(1,j)+1) - gammaln(m(i,j)+1) - gammaln(k(1,j)-m(i,j)+1); %temp=log(nchoosek(k,m))
            meaning_score(i,j) = -1/m(i,j) * (temp - (m(i,j)-1)*log(N(i,1)));
        end
    end
end

min_val = min(meaning_score(meaning_score ~= -Inf));

for i = 1:31
    for j = 1:65792
        if meaning_score(i,j) == -Inf
            meaning_score(i,j) = min_val;
        end
    end
end

for i = 1:31
    [sorted, indexes] = sort(meaning_score(i,:),'descend');
    sorted_score(i,:) = sorted(:);
    sorted_score_index(i,:) = indexes(:);
end


save(strcat('\meaning_kernel\fold', num2str(fold), '\meaning_score.mat') , 'meaning_score', '-v7.3');
save(strcat('\meaning_kernel\fold', num2str(fold), '\sorted_score.mat') , 'sorted_score', '-v7.3');
save(strcat('\meaning_kernel\fold', num2str(fold), '\sorted_score_index.mat') , 'sorted_score_index', '-v7.3');

end

