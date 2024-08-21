%this function allows the player to replay the game once they have won or
%lost
playAgain = 1; 
while playAgain == 1 

clc 
fprintf('Welcome to hangman\n');
fprintf('Individually guess each letter of the unknown word until you guess the word correctly\n')
fprintf('however you will only have 10 lives. If you fail to guess the correct word, the game will end and you will lose!\n');

%ask user if they're ready to begin the game 
ReadyToStart=input('\nAre you ready to play hangman? Yes = 1 and 0 = No: ');
if ReadyToStart==1
   fprintf('\nGreat!, lets begin!\n')   
end


%ask user if they want to play again. return the game back to the start if
%yes. 
while (true)
    playAgain=input('\n Do you want to play agian? Yes = 1 and 0 = No: ');
    if (~strcmpi(playAgain,{'1'}))
        break;
    end 
end
end
