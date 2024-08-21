%This was a fucntion created to find a random word within a dictionary.
%this section was not incoorporated in the final program as it did not
%effectively work 

function [ words ] = readDictionaryHangman(dictFile)
dictText=fileread(dictFile); 
dictWords=splitlines(dictText); 
dictWords=dictWords(1:end-1); 

words=[];
for i=[1:length(dictWords)]  
    words=[words string(dictWords(i))];

end
end


