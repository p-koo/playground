function [clusterIndex,clusterSymptoms,symptomStrength] = BinarySplit(tree,symptoms,symptomName)
% Function for heirarchical clustering of symptoms followed by a binary
% split.  The function returns the condition indices of each binary cluster
% the most unique symptoms which separates each cluster, and the symptom
% weights, which specifies how prevalent each unique symptom is to the
% cluster

    % split classification tee into 2 clusters
    splitIndex = cluster(tree,'maxclust',2);
    
    % cluster statistics
    clusterIndex = cell(2,1);
    clusterSymptoms = zeros(2,size(symptoms,2));
    for i = 1:2
        % get the index of each condition belonging to each cluster
        clusterIndex{i} = find(splitIndex == i);

        % get the average frequency of each symptom for each cluster
        clusterSymptoms(i,:) = mean(symptoms(clusterIndex{i},:),1);
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
        
        symptomIndex = find(clusterSymptoms(otherIndex,:) == 0);

        % select symptoms based on highest strength (or prevalence) for 
        % conditions within a given cluster 
        strength = clusterSymptoms(i,symptomIndex);
        symptomStrength(i) = max(strength);
        clusterSymptoms{i} = symptomName(symptomIndex(strength == max(strength)));
        
    end

end  % end of BinarySplit



