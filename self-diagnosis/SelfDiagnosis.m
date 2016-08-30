function SelfDiagnosis(database)
clc;
 
[symptoms,symptomName,condition] = ParseDatabase(database);
 
% loop that asks questions to narrow down potential conditions
numQuestions = 0;
status = 1;
while status == 1
    
    % generate hierarchical classification tree
    tree = linkage(symptoms,'average');
    
    % split tree into 2 clusters based on prevalence of symptoms
    [clusterIndex,clusterSymptoms,symptomStrength] = BinarySplit(tree,symptoms,symptomName);

    % generate a question about symptoms
    [question,responseIndex] = GenerateQuestion(clusterSymptoms,symptomStrength);    

    % prompt user about symptoms
    response = input([question(1:end-1) ' (yes=1, no=0)? ']);

    % check validity of response
    if isnumeric(response) & (response == 0 | response == 1) & ~isempty(response)
        if response ~= 1
            responseIndex = responseIndex + 1;
            if responseIndex == 3
                responseIndex = 1;
            end
        end

        % narrow down search space
        index = clusterIndex{responseIndex};
        symptoms = symptoms(index,:);
        condition = condition(index);
        numQuestions = numQuestions + 1;
        
        % if length of conditions is 1, then stop
        if length(index) == 1
            status = 0;
            disp(['You may have ' condition{1}]);
        end
    else
        disp('Invalid response... please try again!');
    end
end
end  % end of self diagnosis function


% parses a csv database loaded with importdata function
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


% Function for heirarchical clustering of symptoms followed by a binary
% split.  The function returns the condition indices of each binary cluster
% the most unique symptoms which separates each cluster, and the symptom
% weights, which specifies how prevalent each unique symptom is to the
% cluster
function [clusterIndex,clusterSymptoms,symptomStrength] = BinarySplit(tree,symptoms,symptomName)

    % split classification tee into 2 clusters
    splitIndex = cluster(tree,'maxclust',2);
    
    % cluster statistics
    clusterIndex = cell(2,1);
    avesymptoms = zeros(2,size(symptoms,2));
    for i = 1:2
        % get the index of each condition belonging to each cluster
        clusterIndex{i} = find(splitIndex == i);

        % get the average frequency of each symptom for each cluster
        avesymptoms(i,:) = mean(symptoms(clusterIndex{i},:),1);
    end

    % find prevalent symptoms that best represent each cluster
    clusterSymptoms = cell(2,1);
    symptomStrength = zeros(2,1);
    for i = 1:2

        % find when average symptoms in other cluster is equals zero
        otherIndex = i + 1;
        if otherIndex == 3
            otherIndex = 1;
        end
        symptomIndex = find(avesymptoms(otherIndex,:) == 0);

        % select symptoms based on highest strength (or prevalence) for 
        % conditions within a given cluster 
        strength = avesymptoms(i,symptomIndex);
        symptomStrength(i) = max(strength);
        clusterSymptoms{i} = symptomName(symptomIndex(strength == max(strength)));
    end

end  % end of BinarySplit


% subroutine to generate a question to prompt user
function [question,responseIndex] = GenerateQuestion(clusterSymptoms,symptomStrength)

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


