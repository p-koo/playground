function        [playerValue wins loses] = WinCondition(playerValue,playerCards,dealerCards,bet,wins,show)

% check for bust
if dealerCards > 21
    wins = wins + 1;
    playerValue = playerValue + bet;
elseif playerCards > dealerCards
    wins = wins + 1;
    playerValue = playerValue + bet;
elseif playerCards < dealerCards
    playerValue = playerValue - bet;
end

if show == 't'
    display(strcat('Dealer has: ',int2str(dealerCards)));
    display(strcat('Player has: ',int2str(playerCards)));
end

end