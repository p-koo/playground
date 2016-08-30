function    shuffledDecks = Shuffle(decks, numDecks)


RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));
 
numCards = 52*numDecks;

for i = 1:1
    Z = randperm(numCards)';
    shuffledDecks = decks(Z,:); 
end
