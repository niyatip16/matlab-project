clc
clear 

%this program determines the length of a word and presents spaces for the
%number of letters 

Word = {'nice'}; %a random word is chosen for this, the finak program will incoorporte a list fo words in whichs a random word would be chosen 
length = strlength(Word);
lettersGuessed = ''; 
 
for i=1:length
    spaces = 0;
     char = Word{1}(i);%The unknownWord is an tranform into a character array using the char command. 
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

numOfLives = 10; 
% if the number of spaces = 0, then the correct word has been guessed. 
    if spaces == 0 
        numOfLives = numOfLives-1; % A life is removed if the letter guessed was incorrect 
    end 
      
    % ask user to guess a letter of the unknown word 
    new_char = input('\n guess a letter of the unknown word: ', 's');
    
    % determine if the guessed letter was part of the unknown word or if
    % the letter has already been guessed before

    % Decrement the choice
    numOfLives = numOfLives - 1;
  
    if contains(Word(1), new_char) && ~contains(lettersGuessed, new_char)
        fprintf("Yes this letter is correct!\n");
        % then add above new guessed char to guessed_letters
       lettersGuessed = strcat(lettersGuessed, new_char);
    else
        fprintf("sorry this letter is incorrect!\n");
    end
      