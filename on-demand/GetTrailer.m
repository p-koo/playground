function trailerlink = GetTrailer(name)

name(find(name == ' ')) = '+';

info = urlread(['http://www.youtube.com/results?search_query=' name '+trailer']);

indicator = '<ol id="search-results" class="result-list context-data-container">';
i = 1;
while i < length(info)
    index = find(info(i:end) == indicator(1),1,'first');  
    i = i + index-1;
    for k = 2:length(indicator)
        i = i + 1;
        if info(i) == indicator(k)
            status = 1;
        else
            status = 0;
            break;
        end
    end
    
    if status == 1
        break;
    end
end
  
info2 = info(i:end);
indicator2 = 'data-video-ids="';
i = 1; counter = 0;
while i < length(info2)
    index = find(info2(i:end) == indicator2(1),1,'first');  
    i = i + index-1;
    for k = 2:length(indicator2)
        i = i + 1;
        if info2(i) == indicator2(k)
            status = 1;
        else
            status = 0;
            break;
        end
    end

    if status == 1
        index2 = find(info2(i+1:end) == '"',1,'first');
        trailerlink = ['http://www.youtube.com/watch?v=' info2(i+1:i+index2-1)];
        
        break;
    end
end



