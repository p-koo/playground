function   decision =  BJBook(dealerHand,playerHand, playerCards, numHand, ...
                            bjSoftBook, bjHardBook1, bjHardBook2,bjPairsBook)

col = Convert2(dealerHand(1,2));
if numHand == 2
    
    % if player hands are equal use Pairs table
    if playerHand(1,2) == playerHand(2,2)
        
        row = ConvertPairs(playerHand(1,2));
        decision = bjPairsBook(row,col);
      
    % if player has one ace then use Soft Table    
    elseif playerHand(1,2) == 'a' || playerHand(2,2) == 'a'
        if playerHand(1,2) == 'a'
            row = ConvertSoft(playerHand(2,2));
        else
            row = ConvertSoft(playerHand(1,2));
        end
        decision  = bjSoftBook(row,col);
    else
    % use standard book 
    row = ConvertHard(playerCards);
    decision = bjHardBook1(row,col);
    end
else
    % use standard book 
    row = ConvertHard(playerCards);
    decision = bjHardBook2(row,col);
end

end