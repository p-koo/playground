function    card = AceCheck(hand)

card = 'f';

if hand(1,:) == 'a'
    card = 't';
end

if card == 't'
%     display('Player shows an Ace');
end  

end