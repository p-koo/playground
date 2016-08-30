function [synopsis cast runtime] = GetMovieDetailsSHO(weblink)

synopsis = [];
cast = {};
runtime = [];

website = urlread(weblink);
info = website;


% get synopsis
indicator = '<div class="right product-desc">';
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
indicator = '<p>';
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

index = find(info2(i+1:end) == '<',1,'first');
synopsis = info2(i+1:i+index-1);



% extract actors
indicator = '<th class="actor">';
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
    numCast = 0;
    status = 1;
    while status == 1
        index = find(castinfo == '<',1,'first');
        if castinfo(index+1) == '/';
            status = 0;
        else
            numCast = numCast + 1;
            cast{numCast} = castinfo(3:index-1);
            castinfo(1:index+5) = [];
        end
    end

    clear tmpcast
    indicator = '<td>';
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

    j = 0;
    for i = 1:2:numCast
        j = j + 1;
        cast{j} = tmpcast{i};
    end
end


% get the runtime
indicator = '<b>Duration:</b>';
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

index = find(info(i:end) == 's',1,'first');
runtime = info(i+9:i+index);

        


