
%%

% import database
database = importdata('condition_database.csv');

% parse database
[symptoms,symptomName,condition] = ParseDatabase(database);
 
% generate hierarchical tree
tree = linkage(symptoms,'average');

% plot dendrogram
figure; box on;
dendrogram(tree);
ylabel('Distance');
title('Dendrogram');
set(gca,'fontsize',12,'linewidth',1.5,'box','on');
set(gca,'xticklabel',{condition{4} condition{5} condition{6} condition{1} condition{2} condition{3}});

% first question
Z = linkage(symptoms,'average');
T = cluster(Z,'maxclust',2);
[clusterIndex,clusterSymptoms,symptomWeights] = BinarySplit(symptoms,T,symptomName);

% Do you have 'sinus pain'    'mucus'    'sore throat'
question = GenerateQuestion(clusterSymptoms,symptomWeights);    
disp(question);
disp(['Cluster1: ' num2str(clusterIndex{1}')]);
disp(['Cluster2: ' num2str(clusterIndex{2}')]);


%%


