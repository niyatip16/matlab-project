clc
clear

dict=readDictionary('dictionary.txt'); 
fprintf('the first 10 numbers are\n:'); 
disp(dict(1:10)); 
fprintf('the first 10 numbers are\n:'); 
disp(dict(end-10:end)); 