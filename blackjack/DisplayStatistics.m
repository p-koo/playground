function   DisplayStatistics(totalGames,wins,avebet,playerValue)

% display player statistics 
display('--------------------------');
display('Summary of Results:');
display('--------------------------');
display(strcat('number of games: ',int2str(totalGames)));
display(strcat('number of wins: ',int2str(wins)));
display(strcat('winning percentage: ',int2str(wins/totalGames*100)));
display(strcat('average bet: ',int2str(mean(avebet))));
display(strcat('Profits and Losses: ',int2str(playerValue)));
display('--------------------------');
display('                          ');



end