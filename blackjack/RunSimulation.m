% clear all;
% clc;

% initialize simulation
numReps = 1;
numSim = 100;
counter = 1;
pnl = zeros(numReps,1);


% run simulation
tic
for i = 1:numReps
    
    temp = BJArbitrage(numSim,'f');
    pnl(i) = temp(numSim);
    
    if mod(i,100) == 0
        disp(strcat('simulation #',int2str(i),'out of #',int2str(numReps)));
    end
end
toc

hist(pnl(1:i-1),30);
disp(mean(pnl(1:i-1)))




numSim = 1000;
temp = BJArbitrage(numSim,'f');
plot(temp)






% statistics of simulation
% bjmean = mean(pnl);
% bjstd = std(pnl);
% bjstderror = bjstd/sqrt(numReps);
% bjmin = min(pnl);
% bjmax = max(pnl);

%% mike's pnl
% % 
% % dlmwrite('Mikes100pnl.txt',pnl, 'delimiter', '\t', 'newline', 'pc','precision', 8,'-append');
% mikepnl = dlmread('Mikes100pnl.txt');
% 
% bin = OptimalBinSize(mikepnl,1,100);
% hist(mikepnl,40);
% filename = strcat('Mikes PNL histogram ',int2str(numSim),' sim ',int2str(numReps),' reps');
% title(filename);
% print('-djpeg',filename);
% 
% % statistics of simulation
% mikesmean = mean(mikepnl);
% mikesstd = std(mikepnl);
% mikesstderror = mikesstd/sqrt(length(mikepnl));
% mikesmin = min(mikepnl);
% mikesmax = max(mikepnl);

%% peter's pnl
% 
dlmwrite('peters1000pnl.txt',pnl, 'delimiter', '\t', 'newline', 'pc','precision', 8,'-append');
peterpnl = dlmread('peters1000pnl.txt');

bin = OptimalBinSize(peterpnl,1,100);
hist(peterpnl,40);
filename = strcat('peters PNL histogram ',int2str(numSim),' sim ',int2str(numReps),' reps');
title(filename);
print('-djpeg',filename);

% statistics of simulation
petersmean = mean(peterpnl);
petersstd = std(peterpnl);
petersstderror = petersstd/sqrt(length(peterpnl));
petersmin = min(peterpnl);
petersmax = max(peterpnl);

%% Book
% % dlmwrite('BJ100pnl.txt',pnl, 'delimiter', '\t', 'newline', 'pc','precision', 8,'-append');
% totalpnl = dlmread('BJ100pnl.txt');
% 
% bin = OptimalBinSize(totalpnl,1,100);
% hist(totalpnl,bin);
% filename = strcat('PNL histogram ',int2str(numSim),' sim ',int2str(numReps),' reps');
% title(filename);
% print('-djpeg',filename);
% 
% % statistics of simulation
% bjmean = mean(totalpnl);
% bjstd = std(totalpnl);
% bjstderror = bjstd/sqrt(length(totalpnl));
% bjmin = min(totalpnl);
% bjmax = max(totalpnl);

% [em_thr,em_thr_behavior,P,meanV,stdV,pdf_x,xx,pdf_xx,cdf_xx] = em_1dim(mikepnl(1:1000)', 1);
% 

% mean:      % std:      stderror   % numSim    % numReps   % min         % max
% 52.2875     919.7904    29.0863    1000       1000        -3.4125e+003  2.7125e+003
% 28          915.7578    28.9588    1000       1000        -2.7125e+003  3.0375e+003

% Mikes
% -36.8500    887.3058   28.0591     1000        1000        -3200        3.5875e+003
% Book
% 31.2875     916.2981   12.9584      1000        1000       -2.9125e+003 3625




