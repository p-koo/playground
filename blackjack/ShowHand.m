
function   ShowHand(hand,numHand)


% H2 = imread('H2.jpg');
% H3 = imread('H3.jpg');
% H4 = imread('H4.jpg');
% H5 = imread('H5.jpg');
% H6 = imread('D6.jpg');
% H7 = imread('H7.jpg');
% H8 = imread('H8.jpg');
% H9 = imread('H9.jpg');
% H1 = imread('H1.jpg');
% Hj = imread('Dj.jpg');
% Hq = imread('Hq.jpg');
% Hk = imread('Hk.jpg');
% Ha = imread('Ha.jpg');
% 
% 
% D2 = imread('D2.jpg');
% D3 = imread('H3.jpg');
% D4 = imread('D4.jpg');
% D5 = imread('D5.jpg');
% D6 = imread('D6.jpg');
% D7 = imread('D7.jpg');
% D8 = imread('H8.jpg');
% D9 = imread('D9.jpg');
% D1 = imread('D1.jpg');
% Dj = imread('Dj.jpg');
% Dq = imread('Hq.jpg');
% Dk = imread('Dk.jpg');
% Da = imread('Da.jpg');
% 
% 
% C2 = imread('C2.jpg');
% C3 = imread('C3.jpg');
% C4 = imread('C4.jpg');
% C5 = imread('C5.jpg');
% C6 = imread('C6.jpg');
% C7 = imread('C7.jpg');
% C8 = imread('C8.jpg');
% C9 = imread('C9.jpg');
% C1 = imread('S1.jpg');
% Cj = imread('Cj.jpg');
% Cq = imread('Cq.jpg');
% Ck = imread('Ck.jpg');
% Ca = imread('Ca.jpg');


S2 = imread('S2.jpg');
S3 = imread('S3.jpg');
S4 = imread('S4.jpg');
S5 = imread('S5.jpg');
S6 = imread('S6.jpg');
S7 = imread('S7.jpg');
S8 = imread('S8.jpg');
S9 = imread('S9.jpg');
S1 = imread('S1.jpg');
Sj = imread('Sj.jpg');
Sq = imread('Sq.jpg');
Sk = imread('Sk.jpg');
Sa = imread('Ca.jpg');

 
for i=1:numHand
    subplot(1,numHand,i);
    
    if      (hand(i,2) == 'a')  
        imshow(Sa);  
    elseif  (hand(i,2) == '2') 
        imshow(S2);
    elseif  (hand(i,2) == '3')  
        imshow(S3);
    elseif  (hand(i,2) == '4') 
        imshow(S4);
    elseif  (hand(i,2) == '5')  
        imshow(S5);
    elseif  (hand(i,2) == '6')  
        imshow(S6);
    elseif  (hand(i,2) == '7') 
         imshow(S7);
    elseif  (hand(i,2) == '8') 
        imshow(S8);
    elseif  (hand(i,2) == '9') 
        imshow(S9);
    elseif  (hand(i,2) == '1') 
        imshow(S1);
    elseif  (hand(i,2) == 'j') 
        imshow(Sj);
     elseif  (hand(i,2) == 'q') 
        imshow(Sq);
    elseif  (hand(i,2) == 'k') 
        imshow(Sk);
    end
    
end
end
