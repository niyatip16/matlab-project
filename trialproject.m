clc; clear all;
% Some initial lines
disp('Welcome to Hangman!');
disp('Try to guess the secret word one at a time.');

% Array of possible words, you can also yours
% Please mind to add words that have no more than 8 different char else
% User wouldn't able to solve this since we are giving him 8 chances
words = {'hangman', 'pokamon', 'school', 'studies'};

% total size of above words
s = size(words);
% Getting a random index in range of above length 
random_index = randi(s,1); % 1 represent we need 1 digit in words size

% select that random word
secret_word = words(random_index);
% Calculate the length of above random word
length = strlength(secret_word); % strlength for string length

% no of choices the user have
choice_remaining = 8;
% The letters guessed by users
guessed_letters = '';


% Run the loop till the user has a choice remaining
while choice_remaining > 0
    % set no of spaces (underscore) to 0, we will update this to
    % know how many more letters are there to guess
    spaces = 0;
    
    fprintf("Secret word: ");
    % Run the for loop from index 1 to secret word's length
    for i=1:length
        % Extract the char at current index
        % Note that secret_word will be a cell array so to extract
        % the string we need secret_word{1}, this will give us the string
        % then we can use indexing (i)
        char = secret_word{1}(i); % Get the current char in string
        % Check if current char is already guessed, if yes then print char
        if contains(guessed_letters, char)
            fprintf("%c ", char);
        % Else print "_" and add 1 to number of spaces
        else
            fprintf("_ ");
            spaces = spaces + 1; 
        end
    end
    
    fprintf("\n");
    fprintf("Letters Guessed: %s \n", guessed_letters);
    fprintf("Guesses remaining: %d\n", choice_remaining);
    
    % Check if spaces are 0, means we don't have any spaces left
    % means User has guessed all chars so we don't need to ask more guess
    if spaces == 0
        fprintf("\nYou Win!!! Conagratulations\n");
        choice_remaning = 0; % Set 0 so that while loop won't run
        break; % Break
    end  
    
    % We come here means, spaces > 0 hence we would want user to guess
    new_char = input('\nNext guess: ', 's');
    % Check if the entered char is in our secret word and it was not
    % already guessed
    if contains(secret_word{1}, new_char) && ~contains(guessed_letters, new_char)
        fprintf("Yes!\n");
        % then add above new guessed char to guessed_letters
        guessed_letters = strcat(guessed_letters, new_char);
    else
        fprintf("Nope!\n");
    end
    
    % Decrement the choice
    choice_remaining = choice_remaining - 1;
    fprintf("\n");  

    % For last choice, check the result
    if choice_remaining == 0
        won = 1; % Assume user won
        % Check the whole guessed_letter for every char in secret word
        % If even one char that is in secret word but not in guessed_word
        % means the user has exhausted all the choice and not guessed
        % then make won = 0 and break as we don't need to check more
        for i=1:length
            if ~contains(guessed_letters, secret_word{1}(i))
                fprintf("\nSorry, you lose. The word was: %s\n", secret_word{1});
                won = 0;
                break;
            end
        end
        % Check the status of won, if some char would have been missing
        % then we would have updated the won to won = 0 else it will be 1
        if won > 0
            fprintf("\nYou Win!!! Conagratulations\n");
        end
    end
end