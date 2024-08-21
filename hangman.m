%this function allows the player to replay the game once thyey have won or
%lost
playAgain = 1; 
while playAgain == 1 

%clear all previous varibales and data
clc
clear all

%This program runs the game  "hangman" which asks user to guess the given
%unknown word. The game  requires players to individually guess each letter
%of the word until the correct word is identified. however they pplayer is
%only given 10 lives. if the word is not guessed within the 10 trys, the
%player will lose and the game will be restarted

%in the game off by welcoming the player and informing them what the
%game does and how it work 
fprintf('Welcome to hangman\n');
fprintf('Individually guess each letter of the unknown word until you guess the word correctly\n')
fprintf('however you will only have 10 lives. If you fail to guess the correct word, the game will end and you will lose!\n');
    
%ask user if they're ready to begin the game 
ReadyToStart=input('\nAre you ready to play hangman? Yes = 1 and 0 = No: ');
if ReadyToStart==1
   fprintf('\nGreat!, lets begin!\n')   
end

 %driver for program 
%this function was not incoorporated in the game as it did not function
%properly 
dict=readDictionaryHangman('dictionary.txt');
idx=randperm(length(dict),1);
randomWord = dict{idx}; 

% determine the total length of the unknown word 
lengthOfUnknownWord = size(randomWord);
% using the word list created, a random word would be chosen. The randi
% command allows the program to randomly choose a word from the list. 
randomWord = randi(lengthOfUnknownWord,1);
unknownWord = dict(randomWord);
% determine the length of the unknown word uing the strlength command
length = strlength(unknownWord);

% a certain number of lives is allocated to the player. Once these lives 
% are used, the game will end
numOfLives = 10;

% demonstrate all the letters guessed by the player 
lettersGuessed = '';

% the while loop is used to determine if the player has
% correctly/incorrectly guessed the word. the loop initially determines the
% end of the game
won = 0
while numOfLives > 0 && won==0
    spaces = 0;
    fprintf("\nThe unknown word is: ");
    for i=1:length
        %The unknownWord is an tranform into a character array using the char command 
        char = unknownWord{1}(i); 
        % need to determine if the guess matches the letters in the unknown
        % word. If the letters match, print the letter, else leave blank
        % space 
        if contains(lettersGuessed, char)
            fprintf("%c ", char);
        else
            fprintf("_ ");%fill a dash fr every letter 
            spaces = spaces + 1; 
        end
    end
    
    %display the intial guesses remaining 
    fprintf("\n you have %d guesses remaining\n", numOfLives);
 
    
    % if the number of spaces = 0, then the correct word has been guessed. 
    if spaces == 0 
        fprintf("\nYou Win!!! Well done, you have guessed the correct word\n");
        numOfLives = numOfLives-1; % A life is removed if the letter guessed was incorrect 
    end 
      
    % ask user to guess a letter of the unknown word 
    new_char = input('\n guess a letter of the unknown word: ', 's');
    
    % determine if the guessed letter was part of the unknown word or if
    % the letter has already been guessed before

    % Decrement the choice
    numOfLives = numOfLives - 1;
  
    if contains(unknownWord(1), new_char) && ~contains(lettersGuessed, new_char)
        fprintf("Yes this letter is correct!\n");
        % then add above new guessed char to guessed_letters
       lettersGuessed = strcat(lettersGuessed, new_char);
    else
        fprintf("sorry this letter is incorrect!\n");
    end
    
    
    % For last choice, check the result
        won = 1; % Assume the user has correctly guessed the word
        for i=1:length
            if ~ contains(lettersGuessed, unknownWord{1}(i))
                won = 0;%assume the player did not guess the correct word 
                if numOfLives==0
                    S(1) = load('splat');
                    sound(S(1).y,S(1).Fs) 
                fprintf("\nSorry, you lose!. The correct word was: %s", unknownWord{1});
                break;
                end 
            end
        end
        if won > 0
            S(1) = load('gong');
            sound(S(1).y,S(1).Fs) 
            
            fprintf("\nYou Win!!! Conagratulations\n");
            break;
        end
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
