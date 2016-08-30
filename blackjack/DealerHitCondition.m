function     [dealerCards index] = DealerHitCondition(dealerHand,dealer,decks,index,show)

% asks player if hit is desired
numHand = 2;
dealerCards = AutomaticAceCondition(dealerHand,numHand);

if show =='t'
    set(0,'CurrentFigure',dealer);
    ShowHand(dealerHand,numHand);
end


while dealerCards < 17
    numHand = numHand+1;
    dealerHand(numHand,:) = decks(index,:);
    index = index+1;             
    dealerCards = AutomaticAceCondition(dealerHand,numHand);  

    if show == 't'
        close (dealer)
        figure('Name','Dealers cards','Position',[1 400 numHand*250 300]);    
        ShowHand(dealerHand,numHand);                          
    end 
end


if dealerCards == 17 
    if AceCheck(dealerHand(1,:))=='t' || AceCheck(dealerHand(2,:))=='t'
        numHand = numHand+1;
        dealerHand(numHand,:) = decks(index,:);
        index = index+1;             
        dealerCards = AutomaticAceCondition(dealerHand,numHand);  

        if show == 't'
            close (dealer)
            figure('Name','Dealers cards','Position',[1 400 numHand*250 300]);    
            ShowHand(dealerHand,numHand);                          
        end 
    end
end


