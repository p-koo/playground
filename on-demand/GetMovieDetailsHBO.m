function [synopsis cast year runtime] = GetMovieDetailsHBO(weblink)
synopsis = [];
cast = {};
year = [];
runtime = [];

website = urlread(weblink);
info = website;

% get synopsis of the movie
indicator = '<!-- synopsis and other episodes -->';
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
i = 1;
if status == 1
    indicator2 = '<td class="default">';
    i = 1;
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
            break;
        end
    end
end

index = find(info2(i+1:end) == '<',1,'first');
synopsis = info2(i+1:i+index-1);


% get cast info
info = website;
indicator = '<b>Cast</b>';
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
i = 1;
if status == 1
    indicator2 = '<td class="default" valign="top">';
    i = 1;
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
            break;
        end
    end 
end

castinfo = info2(i+1:end);
numCast = 0;
status = 1;
while status == 1
    index = find(castinfo == '<',1,'first');
    if castinfo(index+1) == '/';
        status = 0;
    else
        numCast = numCast + 1;
        cast{numCast} = castinfo(3:index-1);
        castinfo(1:index+5) = [];;
    end
end



% get year info
info = website;
indicator = '<b>Year</b>';
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
if status == 1
    indicator2 = '<td class="default" valign="top">';
    i = 1;
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
            break;
        end
    end
end

index = find(info2(i:end) == '<',1,'first');
year = info2(i+1:i+index-2);


% get runtime info
info = website;
indicator = '<b>Runtime</b>';
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
if status == 1
    indicator2 = '<td class="default">';
    i = 1;
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
            break;
        end
    end
end

index = find(info2(i:end) == '<',1,'first');
runtime = info2(i+1:i+index-2);
