function  [playerValue surrender blackjack] = SurrenderCondition(playerValue,bet,dealerHand,dealer,show)

blackjack = 'f';
card1 = AceCheck(dealerHand(1,2));
surrender = 'f';

if card1 == 't'
    %display('Dealer shows Ace');
    if show =='t'
        insurance = input('Would you like to surrender (y or n)?','s');
    else
        insurance = 'n'; % InsuranceTable(dealerHand,playerHand);
    end
    
    if insurance == 'y'
        playerValue = playerValue - bet/2;
        surrender = 't';
        blackjack = 't';
    elseif insurance == 'n'
        if CardValue(dealerHand,2)==21
             surrender = 't';
             playerValue = playerValue - bet;
             blackjack='t';
             if show == 't'
                 display('Dealer has blackjack');
                 set(0,'CurrentFigure',dealer);
                 ShowHand(dealerHand,2);
             end
        end
    end
else
    blackjack = 'f';
    if show == 't'
        display(strcat('Dealer Shows: ', int2str(CardValue(dealerHand(1,:),1))));
    end
end

end

