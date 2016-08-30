function pnl = BJArbitrage(numSim,show)
close all;

% set up game w/ number of decks
numDecks = 8;
decks = SetUpGame(numDecks);
numCards = numDecks*52;

% initialize variable
pnl =  zeros(numSim,1);
avebet = zeros(numSim,1);
playerValue = 0;
wins = 0;
totalGames=0;
j=1;
% cardCount = 0;

% load books
[bjSoftBook bjHardBook1 bjHardBook2 bjPairsBook] = LoadBJBooks;


% begin loop to play blackjack
index = 1;
decks = Shuffle(decks,numDecks);
counter = 1;
while totalGames < numSim
    
    % runs till the deck is done
    if index < numCards - 52;
        totalGames = totalGames + 1;
        if show == 't'
            if totalGames ==  counter*1000
                display(strcat('total games: ',int2str(totalGames)));
                counter = counter + 1;
            end
        end
        
        bet = 1;  % bet = BetTable(cardCount);
        
        % deal first set of cards
        playerHand(1,:) = decks(index,:);
        dealerHand(1,:) = decks(index+1,:);
        playerHand(2,:) = decks(index+2,:);
        dealerHand(2,:) = decks(index+3,:);
        
        % begining conditions
        numHand = 2;
        index = index + 4;
        hit = 'h';
        bust = 'f';
        splitCards = 'f';               

        % check to see if player has blackjack
        dealer =0;
        player = 0;
        [playerValue blackjack] = BlackJackCondition(playerHand,dealerHand,playerValue,bet,dealer,wins,'f');
        
        if blackjack == 'f'
            % check to see if dealer shows ace and option to surrender
            [playerValue surrender blackjack2] = SurrenderCondition(playerValue,bet,dealerHand,dealer,'f');
        end
        
        % if no blackjack, game continues
        if blackjack == 'f' && blackjack2 == 'f'      
            % if no surrender, game continues
            if surrender == 'f'
                
                playerCards = CardValue2(playerHand,2);
                
                % asks player if hit is desired
                while hit == 'h'
                    hit =  BJBook(dealerHand,playerHand,playerCards,numHand,bjSoftBook,bjHardBook1, bjHardBook2,bjPairsBook);

                    % hit condition
                    if hit == 'h'   % hit condition
                       numHand = numHand+1;
                       playerHand(numHand,:) = decks(index,:);
                       index = index+1;
                       
                       if CardValue2(playerHand,numHand) > 21
                           playerCards = CardValue(playerHand,numHand);
                       elseif CardValue2(playerHand,numHand) == 21
                           playerCards = 21;
                           hit = 's';
                       else
                            playerCards = CardValue2(playerHand,numHand);                                    
                       end

                       % check for bust
                       if playerCards > 21
                           bust = 't';
                           playerValue = playerValue - bet;             
                           break;
                       end

                    % double down condition   
                    elseif hit == 'd'
          
                       bet=bet*2;
                       numHand = numHand+1;
                       playerHand(numHand,:) = decks(index,:);
                       index = index+1;

                       if CardValue2(playerHand,numHand) > 21
                           playerCards = CardValue(playerHand,numHand);
                       else
                           playerCards = CardValue2(playerHand,numHand);                                 
                       end
                       
                       % check for bust
                       if playerCards > 21
                           bust = 't';
                       end       
                   
                    % split condition   
                    elseif hit == 'p'  
                       numSplit = 2;

                       % show cards
                       splitHand(1,:,2) = playerHand(2,:);
                       splitHand(1,:,1) = playerHand(1,:);
                       splitHand(2,:,1) = decks(index,:);
                       index = index+1;

                       
                       % play single game on each split hand
                       if AceCheck(playerHand(1,:))=='t'
                           playerCards1 = CardValue(playerHand,numHand);
                           playerCards2 = CardValue(playerHand,numHand);
                           blackjack = ['f'; 'f'];
                           bust = ['f'; 'f'];
                           bet = [bet;bet];
                       else
                           [playerValue playerCards1 bust1 index numSplit bet1 blackjack1] ...
                               = SingleGame(splitHand(:,:,1),dealerHand,playerValue,... 
                                     dealer,player,index,decks,bet,wins, numSplit,'f');


                           splitHand(2,:,2) = decks(index,:);
                           index = index+1;

                           [playerValue playerCards2 bust2 index numSplit bet2 blackjack2] ...
                               = SingleGame(splitHand(:,:,2),dealerHand,playerValue,...
                                   dealer,player,index,decks,bet,wins,numSplit,'f');
                           bust = [bust1; bust2];
                           bet = [bet1;bet2];
                           blackjack = [blackjack1; blackjack2];
                       end
                       playerCards = [playerCards1;playerCards2];
                       splitCards = 't';    
                       break;
                       
                    elseif hit == 's'
                        if CardValue2(playerHand,numHand) > 21
                            playerCards = CardValue(playerHand,numHand);
                        else
                            playerCards = CardValue2(playerHand,numHand);                                 
                        end
                        break;
                    end
                end
            end
                
            % Payout conditions
            if splitCards == 't'
                [dealerCards index] = DealerHitCondition(dealerHand,dealer,decks,index,'f'); 
                for i=1:numSplit
                    if blackjack(i) == 'f'
                        if bust(i) == 'f'                               
                            [playerValue wins] = WinCondition(playerValue,playerCards(i),dealerCards,bet(i),wins,'f');
                        else
                            playerValue =  playerValue - bet(i);
                        end
                    else
                        playerValue = playerValue + bet(i);
                        wins = wins+1;
                    end
                end

            else
                if bust =='f'
                    [dealerCards index] = DealerHitCondition(dealerHand,dealer,decks,index,'f');
                    [playerValue wins] = WinCondition(playerValue,playerCards,dealerCards,bet,wins,'f');
                end 
            end
        end % surrender == 'f' loop
%     CountCards(
    pnl(j)=playerValue;
    avebet(j) = mean(bet);
    j=j+1;   
    
    else
        index = 1;
        decks = Shuffle(decks,numDecks); 
    end% index < numCards loop
end  % play another game loop


if show =='t'
    % display player statistics 
    DisplayStatistics(totalGames,wins,avebet,playerValue)

    display(strcat('Average Winnings: ',int2str(mean(pnl(2:end) - pnl(1:end-1)))));
    plot(1:j-1,pnl);
    title('Profits and losses');
    xlabel('number of games played');
    ylabel('Profits ($)');
    print('-djpeg',strcat('Book_',int2str(totalGames),'_simulations'));
end

end
