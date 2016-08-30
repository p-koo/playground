function [synopsis cast] = GetMovieDetailsStarz(weblink)

synopsis = [];
cast = {};

website = urlread(weblink);
info = website;


% get synopsis
indicator = '<meta name="description" content="';
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

index = find(info(i+1:end) == '"',1,'first');
synopsis = info(i+1:i+index-1);


% extract actors
info2 = info;
indicator = 'Starring:';
i = 1;
while i < length(info2)
    index = find(info2(i:end) == indicator(1),1,'first');  
    i = i + index-1;
    for k = 2:length(indicator)
        i = i + 1;
        if info2(i) == indicator(k)
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
castinfo = info2(i+1:end);

if ~isempty(castinfo)
    
    clear tmpcast
    indicator = 'actor login" rel="add">';
    numCast = 0;
    i = 1;
    while i < length(castinfo)
        index = find(castinfo(i:end) == indicator(1),1,'first');  
        i = i + index-1;
        for k = 2:length(indicator)
            i = i + 1;
            if castinfo(i) == indicator(k)
                status = 1;
            else
                status = 0;
                break;
            end
        end

        if status == 1
            numCast = numCast + 1;
            index2 = find(castinfo(i+1:end) == '<',1,'first');
            tmpcast{numCast} = castinfo(i+1:i+index2-1);
        end
    end
    
    if length(tmpcast) > 6
        for i = 1:6
            cast{i} = tmpcast{i};
        end
    else
        cast = tmpcast;
    end
end



