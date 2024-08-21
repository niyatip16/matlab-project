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

 