function img = GetMovieImageFromTMDB(movieName,year)

if nargin == 1 
    year = '';
end
 
index = find(movieName == '''',1,'first');
movieName(index) = [];

status = 1;
while status == 1
    index = find(movieName == ' ',1,'first');
    if ~isempty(index)
        movieName = [movieName(1:index-1) '%20' movieName(index+1:end)];
    else
        status = 0;
    end
end
weblink = ['http://www.themoviedb.org/search/movie?query=' movieName '&movie_page=&movie_collection_page=&person_page=&company_page=&keyword_page=&list_page=&active=0'];
website = urlread(weblink);
info = website; 
if length(info) < 100 
    index = find(movieName == ':',1,'first');
    if ~isempty(index)
        movieName = movieName(1:index-1);
    end

    if ~isempty(year)
        movieName = [movieName ' ' year];
    end
    status = 1;
    while status == 1
        index = find(movieName == ' ',1,'first');
        if ~isempty(index)
            movieName = [movieName(1:index-1) '%20' movieName(index+1:end)];
        else
            status = 0;
        end
    end
    weblink = ['http://www.themoviedb.org/search/movie?query=' movieName '&movie_page=&movie_collection_page=&person_page=&company_page=&keyword_page=&list_page=&active=0'];
    website = urlread(weblink);
    info = website; 
end

indicator = 'src';
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
index1 = find(info2 == '"',1,'first');
index2 = find(info2(index1+1:end) == '"',1,'first');
imageLink = info2(index1+1:index1+index2-1);
try
    img = imread(imageLink);
catch
    img = [];
end

