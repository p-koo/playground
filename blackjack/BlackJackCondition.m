function  [playerValue blackjack win] = BlackJackCondition(playerHand,dealerHand,...
                                            playerValue,bet,dealer,win,show)

card1 = AceCheck(dealerHand(1,2));
blackjack = 'f';

if CardValue2(playerHand,2) == 21 && card1 == 't'
    if show == 't'
        evenMoney = input('Would you like even money?','s');
    else
        evenMoney = 'n'; % evenMoney = EvenMoneyTable(dealerHand,playerHand);
    end
    if evenMoney =='y'
        playerValue = playerValue + bet;
        win=win+1;
    else
        if CardValue2(dealerHand,2)~=21
            playerValue = playerValue + bet*1.5;
            win = win+1;
            if show == 't'
                display('Player has blackjack');
                set(0,'CurrentFigure',dealer);
                ShowHand(dealerHand,2);
            end
        else
            if show =='t'
                display('Dealer has blackjack');        
            end
        end
    end   
    blackjack = 't';
    
    
    if show =='t'
        close (dealer)
        dealer = figure('Name','Dealers cards','Position',[1 500 500 300]);
        ShowHand(dealerHand,2);
        player = figure('Name','Players Cards','Position',[1 40 500 300]);
        ShowHand(playerHand,2);
    end
elseif CardValue2(playerHand,2) == 21 && card1 ~= 't'
    playerValue = playerValue + bet*1.5;
    win = win + 1;
    blackjack = 't';
    
    if show == 't'
        display('Player has blackjack');
        set(0,'CurrentFigure',dealer);
        ShowHand(dealerHand,2);
        close (dealer)
        dealer = figure('Name','Dealers cards','Position',[1 500 500 300]);
        ShowHand(dealerHand,2);
        player = figure('Name','Players Cards','Position',[1 40 500 300]);
        ShowHand(playerHand,2);
    end
elseif CardValue2(dealerHand,2)==21 && CardValue2(playerHand,2)~=21
    if show == 't'
        display('Dealer has blackjack');
        set(0,'CurrentFigure',dealer);
        ShowHand(dealerHand,2);
        close (dealer)
        dealer = figure('Name','Dealers cards','Position',[1 500 500 300]);
        ShowHand(dealerHand,2);
        player = figure('Name','Players Cards','Position',[1 40 500 300]);
        ShowHand(playerHand,2);
    end
    playerValue = playerValue - bet;
    blackjack='t';
end

end