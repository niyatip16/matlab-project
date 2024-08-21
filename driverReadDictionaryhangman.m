%driver for program 

%driver requied to read the dictionary and randomly choose a word. 
%the word will net be displayed, and the player can being guessing letters.
%this program was altered slightly before adding to the final hangman game 

dict=hangman('dictionary.txt');
idx=randperm(length(dict),1);
randoWord = dict{idx};  %using the dictionary word list, a random word would be chosen. The randperm
% command allows the program to randomly choose a word from the list. 
fprintf('the random word is\n');
disp(randomWord); %display the random word 
