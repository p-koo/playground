function   [bjSoftBook bjHardBook1 bjHardBook2 bjPairsBook] = LoadBJBooks


% bjSoftBook = LoadBook('BJSoftBook - mike.xlsx');
% bjHardBook1 = LoadBook('BJHardBook1 - mike.xlsx');
% bjHardBook2 = LoadBook('BJHardBook2 - mike.xlsx');
% bjPairsBook = LoadBook('BJPairsBook - mike.xlsx');

%% bj book
bjHardBook1 = [ 's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' ;
                's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h' ;
                's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h' ;
                's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h' ;
                'h' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h' ;
                'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' ;
                'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h' 'h' ;
                'h' 'h' 'd' 'd' 'd' 'd' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'd' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ];

bjHardBook2 = [ 's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' ;
                's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h' ;
                's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h' ;
                's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h' ;
                'h' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' ];

bjSoftBook = [  's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 's' 'd' 'd' 's' 's' 's' 'h' 's' ;
                'h' 'h' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h' ;
                'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h' ];


bjPairsBook = [ 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' ;
                's' 's' 's' 's' 's' 's' 's' 's' 's' 's' ;
                's' 's' 'p' 'p' 'p' 's' 's' 's' 's' 's' ;
                'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' ;
                'p' 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' ;
                'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h' ;
                'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h' 'h' ;
                'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h' ;
                'p' 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' ;
                'p' 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' ];
            


%% mike's
%dealer shows:   2   3   4   5   6   7   8   9   10   A
% bjSoftBook =   ['s' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 9
%                 's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 8
%                 's' 'd' 'd' 'd' 'd' 's' 's' 'h' 'h' 'h'; % 7
%                 'h' 'd' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 6
%                 'h' 'h' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 5
%                 'h' 'h' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 4
%                 'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 3
%                 'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h']; % 2
%             
% %dealer shows:    2   3   4   5   6   7   8   9   10   A            
% bjHardBook1 = [  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 20
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 19
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 18
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 17
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 16
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 15
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 14
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 13
%                  'h' 'h' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 12
%                  'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h'; % 11
%                  'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h' 'h'; % 10
%                  'h' 'd' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 9
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 8
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 7
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 6
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 5
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 4
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'];% 3 
%              
% %dealer shows:   2   3   4   5   6   7   8   9   10   A            
% bjHardBook2 = [  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 20
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 19
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 18
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 17
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 16
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 15
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 14
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 13
%                  'h' 'h' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 12
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 11
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 10
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 9
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 8
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 7
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 6
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 5
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 4
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'];% 3 
%              
% 
% %dealer shows:   2   3   4   5   6   7   8   9   10   A            
% bjPairsBook = ['p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' ; % A
%                 's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 10
%                 'p' 'p' 'p' 'p' 'p'  's' 'p' 'p' 's' 's'; % 9
%                 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' ; % 8
%                 'p' 'p' 'p' 'p' 'p' 'p'  'h' 'h' 'h' 'h'; % 7
%                 'p' 'p' 'p' 'p' 'p'  'h' 'h' 'h' 'h' 'h'; % 6
%                 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h' 'h'; % 5
%                 'h' 'h' 'h' 'p' 'p'  'h' 'h' 'h' 'h' 'h'; % 4
%                 'p' 'p' 'p' 'p' 'p' 'p'  'h' 'h' 'h' 'h'; % 3
%                 'p' 'p' 'p' 'p' 'p' 'p'  'h' 'h' 'h' 'h']; % 2


% %% peters
% 
% %dealer shows:    2   3   4   5   6   7   8   9   10   A  
% bjSoftBook =   ['s' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 9
%                 's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 8
%                 's' 'd' 'd' 'd' 'd' 's' 's' 'h' 'h' 'h'; % 7
%                 'h' 'd' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 6
%                 'h' 'h' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 5
%                 'h' 'h' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 4
%                 'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 3
%                 'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h']; % 2
%             
% %dealer shows:    2   3   4   5   6   7   8   9   10   A            
% bjHardBook1 = [  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 20
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 19
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 18
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 17
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 16
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 15
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 14
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 13
%                  'h' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 12
%                  'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h'; % 11
%                  'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h' 'h'; % 10
%                  'h' 'd' 'd' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 9
%                  'h' 'h' 'h' 'd' 'd' 'h' 'h' 'h' 'h' 'h'; % 8
%                  'h' 'h' 'h' 'h' 'd' 'h' 'h' 'h' 'h' 'h'; % 7
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 6
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 5
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 4
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'];% 3 
%              
% %dealer shows:   2   3   4   5   6   7   8   9   10   A            
% bjHardBook2 = [  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 20
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 19
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 18
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 17
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 16
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 15
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 14
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 13
%                  'h' 'h' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 12
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 11
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 10
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 9
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 8
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 7
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 6
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 5
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 4
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'];% 3 
%              
% 
% %dealer shows:   2   3   4   5   6   7   8   9   10   A            
% bjPairsBook = [ 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p'; % A
%                 's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 10
%                 'p' 'p' 'p' 'p' 'p' 'p' 'p' 's' 's' 's'; % 9
%                 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h'; % 8
%                 'p' 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h'; % 7
%                 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h'; % 6
%                 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h' 'h'; % 5
%                 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h'; % 4
%                 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h'; % 3
%                 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h']; % 2
%%
%% erics
% 
% %dealer shows:    2   3   4   5   6   7   8   9   10   A  
% bjSoftBook =   ['s' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 9
%                 's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 8
%                 's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 7
%                 'h' 'h' 'h' 'h' 's' 's' 's' 's' 's' 's'; % 6
%                 'h' 'h' 'h' 's' 's' 's' 'h' 'h' 'h' 'h'; % 5
%                 'h' 'h' 'h' 'h' 's' 'h' 'h' 'h' 's' 's'; % 4
%                 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 3
%                 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h']; % 2
%             
% %dealer shows:    2   3   4   5   6   7   8   9   10   A            
% bjHardBook1 = [  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 20
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 19
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 18
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 17
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 16
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 15
%                  'h' 'h' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 14
%                  'h' 'h' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 13
%                  'h' 'h' 'h' 'h' 's' 'h' 'h' 'h' 'h' 'h'; % 12
%                  'h' 'h' 'd' 'd' 's' 'd' 'd' 'd' 'd' 'h'; % 11
%                  'h' 'h' 'd' 'd' 's' 'd' 'd' 'd' 'h' 'h'; % 10
%                  'h' 'h' 'd' 'd' 's' 'h' 'h' 'h' 'h' 'h'; % 9
%                  'h' 'h' 'd' 'd' 's' 'h' 'h' 'h' 'h' 'h'; % 8
%                  'h' 'h' 'h' 'h' 's' 'h' 'h' 'h' 'h' 'h'; % 7
%                  'h' 'h' 'h' 'h' 's' 'h' 'h' 'h' 'h' 'h'; % 6
%                  'h' 'h' 'h' 'h' 's' 'h' 'h' 'h' 'h' 'h'; % 5
%                  'h' 'h' 'h' 'h' 's' 'h' 'h' 'h' 'h' 'h'; % 4
%                  'h' 'h' 'h' 'h' 's' 'h' 'h' 'h' 'h' 'h'];% 3 
%              
% %dealer shows:   2   3   4   5   6   7   8   9   10   A            
% bjHardBook2 = [  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 20
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 19
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 18
%                  's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 17
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 16
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 15
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 14
%                  's' 's' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 13
%                  'h' 'h' 's' 's' 's' 'h' 'h' 'h' 'h' 'h'; % 12
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 11
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 10
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 9
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 8
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 7
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 6
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 5
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'; % 4
%                  'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h' 'h'];% 3 
%              
% 
% %dealer shows:   2   3   4   5   6   7   8   9   10   A            
% bjPairsBook = [ 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p'; % A
%                 's' 's' 's' 's' 's' 's' 's' 's' 's' 's'; % 10
%                 'p' 'p' 'p' 'p' 'p' 'p' 'p' 's' 's' 's'; % 9
%                 'p' 'p' 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h'; % 8
%                 'p' 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h'; % 7
%                 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h'; % 6
%                 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'd' 'h' 'h'; % 5
%                 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h'; % 4
%                 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h'; % 3
%                 'p' 'p' 'p' 'p' 'p' 'h' 'h' 'h' 'h' 'h']; % 2
end 

