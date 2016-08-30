function [question,responseIndex] = GenerateQuestion(clusterSymptoms,symptomStrength)
% subroutine to generate a question to prompt user

    % select which cluster symptoms based on the symptomStrength and also the 
    % index of the cluster for which the response belongs to (responseIndex)
    if symptomStrength(1) == symptomStrength(2)
        if length(clusterSymptoms{1}) > length(clusterSymptoms{2})
            symptomList = clusterSymptoms{1};
            responseIndex = 1;
        else
            symptomList = clusterSymptoms{2};
            responseIndex = 2;
        end
    elseif symptomStrength(1) > symptomStrength(2)
        symptomList = clusterSymptoms{1};
        responseIndex = 1;
    else
        symptomList = clusterSymptoms{2};
        responseIndex = 2;
    end

    % create question
    question = 'Do you have';
    for i = 1:length(symptomList)
        if i == length(symptomList)
            question = [question ' or ' symptomList{i}];
        else
            question = [question ' ' symptomList{i} ','];
        end
    end
    question = [question '?'];

end  % end of GenerateQuestion
