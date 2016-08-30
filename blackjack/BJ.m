
function BJ
close all;

% set up game w/ number of decks
numDecks = 8;
decks = SetUpGame(numDecks);

% play game
numCards = numDecks*52;
playAnother = 1;
playGame = 'd';
playerValue = 0;
wins = 0;
totalGames=0;
j=1;
pnl = [];

[bjSoftBook bjHardBook1 bjHardBook2 bjPairsBook] = LoadBJBooks;

% begin loop to play blackjack
while playAnother == 1
    
    index = 1;
    decks = Shuffle(decks,numDecks);
    
    % runs till the deck is done
    while index < numCards - 52
        while playGame == 'd'
            if index > numCards-52
                break;
            end
            
            playGame = input('Play Game (d = deal, q = quit): ','s');
            if playGame == 'd'
                totalGames = totalGames + 1;
                close all;
                clc;
                clear playerHand dealerHand;
                
                if index > 1
                    DisplayStatistics(totalGames,wins,avebet,playerValue)
                end

                betstatus = 1;
                while betstatus == 1
                    bet = input('Place amount to bet: ');
                    if isnumeric(betstatus) 
                        if bet > 0
                            betstatus = 0;
                        else
                            disp('place a real bet... idiot!');
                        end
                    end
                end
                
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

                % displays cards
                dealer = figure('Name','Dealers cards','Position',[1 600 500 300]);
                ShowHand(dealerHand(1,:),1);
                player = figure('Name','Players Cards','Position',[1 40 500 300]);
                ShowHand(playerHand,2);
                

                % check to see if player has blackjack
                [playerValue blackjack wins] = BlackJackCondition(playerHand,dealerHand,playerValue,bet,dealer,wins,'t');
                
                ShowHand(playerHand,2);
                if blackjack == 'f'
                    % check to see if dealer shows ace and option to surrender
                    [playerValue surrender blackjack2] = SurrenderCondition(playerValue,bet,dealerHand,dealer,'t');
                end
                
                % if no blackjack, game continues
                if blackjack == 'f' && blackjack2 == 'f'      
                    % if no surrender, game continues
                    if surrender == 'f'
                        playerCards = CardValue2(playerHand,2);
                        display(strcat('Player Shows: ', int2str(playerCards)));

                        % asks player if hit is desired
                        while hit == 'h'
                            book =  BJBook(dealerHand,playerHand,playerCards,numHand,bjSoftBook,bjHardBook1, bjHardBook2,bjPairsBook);
                            display(strcat('the book says to: ',book));
                            hit =  input('Hit (h = hit, s = stay, d = double down, p = split): ','s');

                            % hit condition
                            if hit == 'h'   % hit condition
                               numHand = numHand+1;
                               playerHand(numHand,:) = decks(index,:);
                               index = index+1;

                               close (player)
                               figure('Name','Player cards','Position',[1 40 numHand*250 300]);
                               ShowHand(playerHand,numHand);
                               
                               
                               if CardValue2(playerHand,numHand) > 21
                                   playerCards = CardValue(playerHand,numHand);
                               elseif CardValue2(playerHand,numHand) == 21
                                   playerCards = 21;
                                   hit = 's';
                               else
                                    playerCards = CardValue2(playerHand,numHand);                                    
                               end
                               display(strcat('Player Shows: ',int2str(playerCards)));


                               
                               % check for bust
                               if playerCards > 21
                                   display('Player bust');
                                   bust = 't';
                                   playerValue = playerValue - bet;
                                   set(0,'CurrentFigure',dealer);
                                   ShowHand(dealerHand,2);                        
                                   break;
                               end

                            % double down condition   
                            elseif hit == 'd'
                               if numHand > 2
                                   display('Cant double down right now idiot');
                                   hit = 'h';
                               else
                                   bet=bet*2;
                                   numHand = numHand+1;
                                   playerHand(numHand,:) = decks(index,:);
                                   index = index+1;

                                   close (player)
                                   figure('Name','Player cards','Position',[1 40 numHand*250 300]);
                                   ShowHand(playerHand,numHand);

                                   if CardValue2(playerHand,numHand) > 21
                                       playerCards = CardValue(playerHand,numHand);
                                   else
                                       playerCards = CardValue2(playerHand,numHand);                                 
                                   end
                                 
                                   display(strcat('Player Shows: ',int2str(playerCards)));

                                   % check for bust
                                   if playerCards > 21
                                       display('Player bust');
                                       bust = 't';
                                   end       
                               end

                            % split condition   
                            elseif hit == 'p' 

                               if playerHand(1,2) ~= playerHand(2,2)
                                   display('hey dummy, cant split these');
                                   hit = 'h';
                               else
                                   numSplit = 2;
                                   close (player);

                                   % show cards
                                   splitHand(1,:,2) = playerHand(2,:);
                                   splitPlot(2) = figure('Name','Player cards','Position',[1 40 500 300]);
                                   set(0,'CurrentFigure',splitPlot(2));
                                   ShowHand(splitHand(1,:,2),1);
                        
                                   splitHand(1,:,1) = playerHand(1,:);
                                   splitHand(2,:,1) = decks(index,:);
                                   index = index+1;
                                   splitPlot(1) = figure('Name','Player cards','Position',[500 40 500 300]); 
                                   set(0,'CurrentFigure',splitPlot(1));
                                   ShowHand(splitHand(:,:,1),2);

                                   
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
                                                 dealer,splitPlot(1),index,decks,bet,wins, numSplit,'t');


                                       splitHand(2,:,2) = decks(index,:);
                                       index = index+1;
                                       set(0,'CurrentFigure',splitPlot(2));
                                       ShowHand(splitHand(:,:,2),2);

                                       [playerValue playerCards2 bust2 index numSplit bet2 blackjack2] ...
                                           = SingleGame(splitHand(:,:,2),dealerHand,playerValue,...
                                               dealer,splitPlot(2),index,decks,bet,wins,numSplit,'t');
                                       bust = [bust1; bust2];
                                       bet = [bet1;bet2];
                                       blackjack = [blackjack1; blackjack2];
                                   end
                                   playerCards = [playerCards1;playerCards2];
                                   splitCards = 't';    
                                   break;
                               end
                            elseif hit == 's'
                                if CardValue2(playerHand,numHand) > 21
                                       playerCards = CardValue(playerHand,numHand);
                                   else
                                       playerCards = CardValue2(playerHand,numHand);                                 
                                end
                                
                                break;
                            else
                                display('wrong letter idiot');
                                hit = 'h';
                            end
                        end
                    end
                
                    % Payout conditions
                    if splitCards == 't'
                        [dealerCards index] = DealerHitCondition(dealerHand,dealer,decks,index,'t'); 
                        for i=1:numSplit
                            if blackjack(i) == 'f'
                                if bust(i) == 'f'                               
                                    [playerValue wins] = WinCondition(playerValue,playerCards(i),dealerCards,bet(i),wins,'t');
                                else
                                    playerValue =  playerValue - bet(i);
                                end
                            else
                                playerValue = playerValue + bet(i);
                                wins = wins + 1;
                            end
                        end
                    else
                        if bust =='f'
                            [dealerCards index] = DealerHitCondition(dealerHand,dealer,decks,index,'t');
                            [playerValue wins] = WinCondition(playerValue,playerCards,dealerCards,bet,wins,'t');
                        end
                    end
                end % surrender == 'f' loop

            % gather player statistics
            display(strcat('PNL: ',int2str(playerValue)));
            pnl(j)=playerValue;
            avebet(j) = mean(bet);
            j=j+1;

            elseif playGame == 'q'
                break;
            else
                display('wrong letter idiot');
                playGame = 'd';
            end % playgame == 'd' loop
        end
        if playGame == 'q'
            break;
        end
    end % index < numCards loop
    
    % if player wants to quit
    if playGame == 'q'
        break;
    else
        playStatus = 0;
        while playStatus == 0
            playAnother = input('Play Another Shoe Game (yes=1, no=0): ');
            if isnumeric(playAnother) 
                if playAnother == 1
                    playStatus = 1;
                elseif playAnother == 0
                    playStatus = 1;
                else
                    disp('place a real bet... idiot!');
                end
            end
        end
    end

end  % play another game loop

clc
% display player statistics 
DisplayStatistics(totalGames,wins,avebet,playerValue)


close all;
plot(1:j-1,pnl);
title('Profits and losses');
xlabel('number of games played');
ylabel('Profits ($)');

end

