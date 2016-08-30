function  [playerCards cond]= AceCondition(playerHand,numHand,show)

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

choice = 'f';

if counter > 0   
    if k > 1
        playerCards = CardValue(playerHand(index,:),numHand-counter);
        if show =='t'
            display(strcat('other cards sum to:  ',int2str(playerCards)));
        end
    end

    if show =='t'
        display(strcat('you have:  ',int2str(counter),' aces'));
    end
    for i=1:counter
        if show =='t'
            while choice == 'f'
                choose = input('Please choose between 1 and 11 for the ace: ');
                if choose == 1 || choose == 11
                    choice = 't';
                else
                    display('read the directions idiot');
                    choice = 'f';
                end
            end
        else
              if CardValue2(playerHand,numHand) > 21
                  choose = 1;
              else
                  choose = 11;
              end
        end
        playerCards = playerCards + choose;
    end
    cond='t';
else
    playerCards = CardValue(playerHand,numHand);
    cond = 'f';
end
    
end

    
    