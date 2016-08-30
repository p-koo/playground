function   book = LoadBook(filename)

temp = xlsread(filename);
temp(1,:) = [];
temp(:,1)= [];

[m n] = size(temp);
for i = 1:m
    for j= 1:n
        if temp(i,j) == 1
            book(i,j) = 's';
        elseif temp(i,j) == 2
            book(i,j) = 'h';
        elseif temp(i,j) == 3
            book(i,j) = 'd';
        elseif temp(i,j) == 4
            book(i,j) = 'p';
        end
    end
end

end