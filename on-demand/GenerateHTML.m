% setup html file

fid = fopen('MoviesOnDemand.html','w+');
fprintf(fid,'%s\n','<html>');

fprintf(fid,'%s\n','<style type = "text/css">');
fprintf(fid,'%s\n','td{font-family:Arial; font-size:8pt;}');


fprintf(fid,'%s\n','body {');
fprintf(fid,'\t%s\n','height: 600px;');
fprintf(fid,'\t%s\n','width: 900 px;');
fprintf(fid,'\t%s\n','background-color: #E8E8E8;');
fprintf(fid,'%s\n','}');
fprintf(fid,'\n');


fprintf(fid,'%s\n','#header{');
fprintf(fid,'\t%s\n','background: #2D5A8E;');
fprintf(fid,'\t%s\n','position: absolute;');
fprintf(fid,'\t%s\n','padding-left: 0px;');
fprintf(fid,'\t%s\n','top: 10px;');
fprintf(fid,'\t%s\n','left: 50px;');
fprintf(fid,'\t%s\n','right: 0px;');
fprintf(fid,'\t%s\n','width: 798px;');
fprintf(fid,'\t%s\n','height: 80px;');
fprintf(fid,'%s\n','}');
fprintf(fid,'\n');


fprintf(fid,'%s\n','#content {');
fprintf(fid,'\t%s\n','background: #F8F8F8;');
fprintf(fid,'\t%s\n','position: absolute;');
fprintf(fid,'\t%s\n','top: 100px;');
fprintf(fid,'\t%s\n','left: 50px;');
fprintf(fid,'\t%s\n','width: 798;');
N = 8000;
fprintf(fid,'\t%s\n',['height: ' num2str(N) 'px;']);
fprintf(fid,'\n');


fprintf(fid,'%s\n','#intro{');
fprintf(fid,'\t%s\n','padding-right: 50px;');
fprintf(fid,'\t%s\n','padding-left: 50px;');
fprintf(fid,'%s\n','}');



fprintf(fid,'%s\n','#footer {');
fprintf(fid,'\t%s\n','background: #2D5A8E;');
fprintf(fid,'\t%s\n','position: absolute;');
fprintf(fid,'\t%s\n',['top:' num2str(N+120) 'px;']);
fprintf(fid,'\t%s\n','left: 50px;');
fprintf(fid,'\t%s\n','width: 798px;');
fprintf(fid,'\t%s\n','height: 50px;');
fprintf(fid,'\t%s\n','bottom: 10px;');
fprintf(fid,'\n');


% body
fprintf(fid,'%s\n','</style>');
fprintf(fid,'%s\n','</head>');
fprintf(fid,'%s\n','<body>');
fprintf(fid,'\n');

fprintf(fid,'\t%s\n','<div id="header">');
fprintf(fid,'\t\t%s\n','<br><center>  <font color = "#FFFFFF" size = "6"><B>Movies on Demand</B></font><br> <br>');
fprintf(fid,'\t%s\n','</div>');
fprintf(fid,'\n');
   
    
fprintf(fid,'\t%s\n','<div id="content">');
fprintf(fid,'\t%s\n','<p>&nbsp;</p>');
fprintf(fid,'\t%s\n','<div id="intro">');


%%
% HBO On Demand list
weblink = 'http://www.hboondemand.com/apps/hodschedule/hod/category.do?CATG_ID=BTRS302';
website = urlread(weblink);
info = website;

indicator = '<td width="282" class="default_link">';

clear movieName tmpsynopsis tmpcast tmpyear tmpruntime trailerlink
numMovies = 0;
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
        numMovies = numMovies + 1;
       
        % get movie title
        index1 = find(info(i+2:end) == '>',1,'first');
        index2 = find(info(i+2:end) == '<',1,'first');
        movieName{numMovies} = info(i+2+index1:i+index2);
        disp(movieName{numMovies});
    
        % extract other movie info
        index1 = find(info(i:end) == '"',1,'first');
        index2 = find(info(i+index1+1:end) == '"',1,'first');
        weblink = info(i+index1:i+index1+index2-1);
        [tmpsynopsis{numMovies} tmpcast{numMovies} tmpyear{numMovies} tmpruntime{numMovies}] ...
               = GetMovieDetailsHBO(['http://www.hboondemand.com' weblink]);
  
        i = i+1+index+1;
    end
end

% filter non movies
clear title cast synopsis year runtime
j = 0;
for i = 1:numMovies
    index = find(tmpruntime{i} == 'M',1,'first');
    if str2num(tmpruntime{i}(1:index-2)) > 30
        j = j + 1;
        title{j} = movieName{i};
        synopsis{j} = tmpsynopsis{i};
        cast{j} = tmpcast{i};
        year{j} = tmpyear{i};
        runtime{j} = tmpruntime{i};
        trailerlink{j} = GetTrailer(title{j});
    end
end
numMovies = j;

fprintf(fid,'\t%s\n','<font size = "6"><B>HBO On Demand (channel 300)</B></font><br>');
fprintf(fid,'\t%s\n','<font size = "1">');
fprintf(fid,'\t%s\n','<table border="1">');


fprintf(fid,'\t%s\n','<tr>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Title</font></center></B></td>');  
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Year</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Synopsis</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Cast</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Length (min)</font></center></B></td>');
fprintf(fid,'\t%s\n','</tr>');
for i = 1:numMovies
    fprintf(fid,'\t%s\n','<tr>');
    fprintf(fid,'\t%s\n',['<td><a href="' trailerlink{i} '" target="_blank"><B><font size=3><center>' title{i} '</center></font></B></a> </td>']);
    fprintf(fid,'\t%s\n',['<td><center>' year{i} '</center></td>']);    
    fprintf(fid,'\t%s\n',['<td><font color="green">' synopsis{i} '</font></td>']);
    castlist = [];
    for j = 1:min(3,length(cast{i}))
        castlist = [castlist cast{i}{j} ', '];
    end
    fprintf(fid,'\t%s\n',['<td>' castlist(1:end-2) '</td>']);
    index = find(runtime{i} == 'M',1,'first'); 
    fprintf(fid,'\t%s\n',['<td><center>' runtime{i}(1:index-1) '</center></td>']);
    fprintf(fid,'\t%s\n','</tr>');
end
fprintf(fid,'\t%s\n','</table><br><br>'); 
fprintf(fid,'\n'); 


%%
% Showtime on Demand list
weblink = 'http://www.sho.com/sho/schedules/ondemand/movies#/index';
website = urlread(weblink);
info = website;

indicator = '"displayTitle" : "';

clear title synopsis cast runtime trailerlink
numMovies = 0;
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
        numMovies = numMovies + 1;
        
        % get movie title
        index2 = find(info(i+1:end) == '"',1,'first');
        title{numMovies} = info(i+1:i+index2-1);
        disp(title{numMovies});
        
        % get trailer link
        trailerlink{numMovies} = GetTrailer(title{numMovies});
        
        % get other movie info
        info2 = info(i-150:i);

        indicator2 = '"url" : "';
        i2 = 1; counter = 0;
        while i2 < length(info2)
            index = find(info2(i2:end) == indicator2(1),1,'first');  
            i2 = i2 + index-1;
            for k = 2:length(indicator2)
                i2 = i2 + 1;
                if info2(i2) == indicator2(k)
                    status = 1;
                else
                    status = 0;
                    break;
                end
            end

            if status == 1
                index2 = find(info2(i2+1:end) == '"',1,'first');
                weblink = info2(i2+1:i2+index2-1);
                [synopsis{numMovies} cast{numMovies} runtime{numMovies}] = ...
                            GetMovieDetailsSHO(['http://www.sho.com' weblink]);
                break;
            end
        end
               
        i = i+1+index+1;
    end
end

fprintf(fid,'\t%s\n','<font size = "6"><B>Showtime On Demand (channel 320)</B></font><br>');
fprintf(fid,'\t%s\n','<font size = "1">');
fprintf(fid,'\t%s\n','<table border="1">');


fprintf(fid,'\t%s\n','<tr>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Title</font></center></B></td>');  
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Synopsis</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Cast</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Length (min)</font></center></B></td>');
fprintf(fid,'\t%s\n','</tr>');
for i = 1:numMovies
    fprintf(fid,'\t%s\n','<tr>');
    fprintf(fid,'\t%s\n',['<td><a href="' trailerlink{i} '" target="_blank"><B><font size=3><center>' title{i} '</center></font></B></a> </td>']);
    fprintf(fid,'\t%s\n',['<td><font color="green">' synopsis{i} '</font></td>']);
    
    castlist = [];
    for j = 1:min(3,length(cast{i}))
        castlist = [castlist cast{i}{j} ', '];
    end
    fprintf(fid,'\t%s\n',['<td>' castlist(1:end-2) '</td>']);
    index = find(runtime{i} == 'm',1,'first'); 
    fprintf(fid,'\t%s\n',['<td><center>' runtime{i}(1:index-1) '<center></td>']);
    fprintf(fid,'\t%s\n','</tr>');
end
fprintf(fid,'\t%s\n','</table><br><br>'); 
fprintf(fid,'\n'); 

%%

% Get Starz on Demand List
weblink = 'http://www.starz.com/schedule/ondemandlistings?filter=ALL';
website = urlread(weblink);
info = website;

indicator = '<td class="title">';

clear title year synopsis cast trailerlink
numMovies = 0;
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
        numMovies = numMovies + 1;
        
        % get the weblink
        index1 = find(info(i:end) == '"',1,'first');
        index2 = find(info(i+index1+1:end) == '"',1,'first');
        weblink = info(i+index1:i+index1+1+index2-2);
        [synopsis{numMovies} cast{numMovies}] ...
                = GetMovieDetailsStarz(['http://www.starz.com/' weblink]);
        
        % get movie name
        index1 = find(info(i+2:end) == '>',1,'first');
        index2 = find(info(i+2:end) == '<',1,'first');
        title{numMovies} = info(i+2+index1:i+index2);
        i = i+index2+1;
        disp(title{numMovies})
        
        % get trailer link
        trailerlink{numMovies} = GetTrailer(title{numMovies});
        
        % get the year
        index1 = find(info(i+10:end) == '>',1,'first');
        index2 = find(info(i+10+index1+1:end) == '<',1,'first');
        year{numMovies} = info(i+10+index1:i+8+index1+1+index2);
        i = i+index2+1;
    end
end

fprintf(fid,'\t%s\n','<font size = "6"><B>Starz On Demand (channel 339)</B></font><br>');
fprintf(fid,'\t%s\n','<font size = "1">');
fprintf(fid,'\t%s\n','<table border="1">');

fprintf(fid,'\t%s\n','<tr>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Title</font></center></B></td>');  
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Year</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Synopsis</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Cast</font></center></B></td>');
fprintf(fid,'\t%s\n','</tr>');
for i = 1:numMovies
    fprintf(fid,'\t%s\n','<tr>');
    fprintf(fid,'\t%s\n',['<td><a href="' trailerlink{i} '" target="_blank"><B><font size=3><center>' title{i} '</center></font></B></a> </td>']);
    fprintf(fid,'\t%s\n',['<td><center>' year{i} '</center></td>']);
    fprintf(fid,'\t%s\n',['<td><font color="green">' synopsis{i} '</font></td>']);
    castlist = [];
    for j = 1:min(3,length(cast{i}))
        castlist = [castlist cast{i}{j} ', '];
    end
    fprintf(fid,'\t%s\n',['<td>' castlist(1:end-2) '</td>']);
    fprintf(fid,'\t%s\n','</tr>');
end
fprintf(fid,'\t%s\n','</table><br><br>'); 
fprintf(fid,'\n'); 

%%

% Get Encore on Demand List
weblink = 'http://www.starz.com/schedule/ondemandlistings/eoda?filter=ALL';
website = urlread(weblink);
info = website;

indicator = '<td class="title">';

clear title synopsis cast year trailerlink
numMovies = 0;
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
        numMovies = numMovies + 1;
        
        % get the weblink
        index1 = find(info(i:end) == '"',1,'first');
        index2 = find(info(i+index1+1:end) == '"',1,'first');
        weblink = info(i+index1:i+index1+1+index2-2);
        [synopsis{numMovies} cast{numMovies}] ...
                = GetMovieDetailsStarz(['http://www.starz.com/' weblink]);
        
        % get movie name
        index1 = find(info(i+2:end) == '>',1,'first');
        index2 = find(info(i+2:end) == '<',1,'first');
        title{numMovies} = info(i+2+index1:i+index2);
        disp(title{numMovies});
        i = i+index2+1;
        
        % get trailer link
        trailerlink{numMovies} = GetTrailer(title{numMovies});
        
        % get the year
        index1 = find(info(i+10:end) == '>',1,'first');
        index2 = find(info(i+10+index1+1:end) == '<',1,'first');
        year{numMovies} = info(i+10+index1:i+8+index1+1+index2);
        i = i+index2+1;
    end
end

fprintf(fid,'\t%s\n','<font size = "6"><B>Encore On Demand (channel 349)</B></font><br>');
fprintf(fid,'\t%s\n','<font size = "1">');
fprintf(fid,'\t%s\n','<table border="1">');


fprintf(fid,'\t%s\n','<tr>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Title</font></center></B></td>');  
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Year</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Synopsis</font></center></B></td>');
fprintf(fid,'\t%s\n','<td><B><center><font size=3>Cast</font></center></B></td>');
fprintf(fid,'\t%s\n','</tr>');
for i = 1:numMovies
    fprintf(fid,'\t%s\n','<tr>');
    fprintf(fid,'\t%s\n',['<td><a href="' trailerlink{i} '" target="_blank"><B><font size=3><center>' title{i} '</center></font></B></a> </td>']);
    fprintf(fid,'\t%s\n',['<td><center>' year{i} '</center></td>']);
    fprintf(fid,'\t%s\n',['<td><font color="green">' synopsis{i} '</font></td>']);
    castlist = [];
    for j = 1:min(3,length(cast{i}))
        castlist = [castlist cast{i}{j} ', '];
    end
    fprintf(fid,'\t%s\n',['<td>' castlist(1:end-2) '</td>']);
    fprintf(fid,'\t%s\n','</tr>');
end
fprintf(fid,'\t%s\n','</table><br><br>'); 
fprintf(fid,'\n'); 

%%

fprintf(fid,'%s\n','</font></center></div>');
fprintf(fid,'%s\n','</div>');
fprintf(fid,'%s\n','<div id="footer">');
fprintf(fid,'%s\n','</div>');

fprintf(fid,'%s\n','</body>');
fprintf(fid,'%s\n','</html>');

fclose(fid);
                           

HOSTNAME = 'mymeerkat.is-a-geek.com';
USERNAME = 'peter';
PASSWORD = 'physics';
ssh2_conn = scp_simple_put(HOSTNAME,USERNAME,PASSWORD,'MoviesOnDemand.html','/var/www');




      