function    [playerValue playerCards bust index numSplit bet blackjack]= SingleGame(playerHand,dealerHand,...
                                playerValue,dealer,player,index,decks,bet,wins, numSplit,show)

     
% begining conditions
numHand = 2;
index = index + 4;
hit = 'h';
bust = 'f';
splitCards = 'f';
playerCards = 0;
% load books
[bjSoftBook bjHardBook1 bjHardBook2 bjPairsBook] = LoadBJBooks;
            
% check to see if player has blackjack
[playerValue blackjack wins] = BlackJackCondition(playerHand,dealerHand,playerValue,bet,dealer,wins,show);

 % if no blackjack, game continues
if blackjack =='f'
  
    playerCards = CardValue2(playerHand,2);
    if show =='t'
        set(0,'CurrentFigure',player);
        display(strcat('Player Shows: ', int2str(playerCards)));
    end
    % asks player if hit is desired
    while hit == 'h'
        if show =='t'
            book = BJBook(dealerHand,playerHand, playerCards, numHand, bjSoftBook, bjHardBook1, bjHardBook2, bjPairsBook);
            display(strcat('the book says to: ',book));
            hit =  input('Hit (h = hit, s = stay, d = double down, p = split): ','s');
        else
            hit = BJBook(dealerHand,playerHand, playerCards, numHand, bjSoftBook, bjHardBook1, bjHardBook2, bjPairsBook);
        end
        
        % hit condition
        if hit == 'h'   % hit condition
           numHand = numHand+1;
           playerHand(numHand,:) = decks(index,:);
           index = index+1;

           if show =='t'
               set(0,'CurrentFigure',player);
               ShowHand(playerHand,numHand);
           end
           
           if CardValue2(playerHand,numHand) > 21
                playerCards = CardValue(playerHand,numHand);
           elseif CardValue2(playerHand,numHand) == 21
               hit = 's';
               playerCards = 21;
           else
                playerCards = CardValue2(playerHand,numHand);
           end
                               
           if show == 't'
                display(strcat('Player Shows: ',int2str(playerCards)));
           end
           
           % check for bust
           if playerCards > 21
               if show == 't'
                   display('Player bust');
               end
               bust = 't';
               break;
           end

        % double down condition   
        elseif hit == 'd'
           if numHand > 2
               if show == 't'
                   display('cant double down right now idiot');
               end
               hit = 'h';
           else
               bet=bet*2;
               numHand = numHand+1;
               playerHand(numHand,:) = decks(index,:);
               index = index+1;
               if show == 't' 
                   set(0,'CurrentFigure',player);
                   ShowHand(playerHand,numHand);
               end
               
               if CardValue2(playerHand,numHand) > 21
                   playerCards = CardValue(playerHand,numHand);
               else
                   playerCards = CardValue2(playerHand,numHand);                                 
               end
               
               if show == 't'
                   display(strcat('Player Shows: ',int2str(playerCards)));
               end
               
               % check for bust
               if playerCards > 21
                   if show == 't'
                       display('Player bust');
                   end
                   bust = 't';
               end       
           end

        % split condition   
        elseif hit == 'p' 

           if playerHand(1,2) ~= playerHand(2,2)
               if show == 't'
                   display('hey dummy, cant split these');
               end
               hit = 'h';
           else    
               numSplit = numSplit + 1;
               

               % show cards
               splitHand(1,:,2) = playerHand(2,:);
               
               if show == 't'
                   close (player);
                   splitPlot(2) = figure('Name','Dealers cards','Position',[1 40 500 300]);
                   set(0,'CurrentFigure',splitPlot(2));
                   ShowHand(splitHand(1,:,2),1);
               else
                    splitPlot(2) = 1;
               end
               
               splitHand(1,:,1) = playerHand(1,:);
               splitHand(2,:,1) = decks(index,:);
               index = index+1;
               if show == 't'
                   splitPlot(1) = figure('Name','Dealers cards','Position',[500 40 500 300]); 
                   set(0,'CurrentFigure',splitPlot(1));
                   ShowHand(splitHand(:,:,1),2);
               else
                   splitPlot(1) = 1;
               end
 
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
                             dealer,splitPlot(1),index,decks,bet,wins, numSplit,show);


                   splitHand(2,:,2) = decks(index,:);
                   index = index+1;
                   if show == 't'
                       set(0,'CurrentFigure',splitPlot(2));
                       ShowHand(splitHand(:,:,2),2);
                   end
                   
                   [playerValue playerCards2 bust2 index numSplit bet2 blackjack2] ...
                       = SingleGame(splitHand(:,:,2),dealerHand,playerValue,...
                           dealer,splitPlot(2),index,decks,bet,wins,numSplit,show);
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
            if show =='t'
                display('wrong letter idiot');
            end
            hit = 'h';
        end
    end


end % blackjack == 'f' loop
end
