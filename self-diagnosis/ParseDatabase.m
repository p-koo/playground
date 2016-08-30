function  [symptoms,symptomName,condition] = ParseDatabase(database)

    % get binary presence of symptoms
    symptoms = database.data;

    % get symptoms
    symptomName = cell(1,size(database.textdata,2)-1);
    for i = 2:size(database.textdata,2)
        symptomName{i-1} = database.textdata{1,i};
    end

    % get conditions
    condition = cell(1,size(database.textdata,1)-1);
    for i = 2:size(database.textdata,1)
        condition{i-1} = database.textdata{i,1};
    end

end  % end of parse database function