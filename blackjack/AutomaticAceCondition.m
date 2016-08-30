function playerCards = AutomaticAceCondition(playerHand,numHand)

playerCards=0;

counter=0;
k=1;
for i=1:numHand
    card(i) = AceCheck(playerHand(i,2));
    if card(i) =='t'
        counter =  counter + 1;
        indexAce(counter)=i;
    else 
        index(k)=i;
        k=k+1;
    end
end

if counter > 0
    if counter == numHand
        playerCards = 0;
    else
        playerCards = CardValue(playerHand(index,:),numHand-counter);
    end
    for i=1:counter
        if playerCards + 11 <= 21
            playerCards = playerCards + 11;
        else
            playerCards = playerCards + 1;
        end
    end
    cond='t';
else
    playerCards = CardValue(playerHand,numHand);
    cond = 'f';
end
    
end
