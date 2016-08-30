function GetMovieImageFromIMDB(moviename)

weblink = ['http://www.imdb.com/find?q=' moviename '&s=all'];
website = urlread(weblink);
info = website;


% Find the first search link
indicator = '<div class="findSection">';
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
indicator2 = '<td class="result_text">';
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
        break;
    end
end
info3 = info2(i2:end);
index1 = find(info3 == '"',1,'first');
index2 = find(info3(index1+1:end) == '"',1,'first');
weblink = ['http://www.imdb.com' info3(index1+1:index1+index2-1)];

weblink = 'http://www.imdb.com/title/tt1232829/?ref_=fn_al_tt_1';

% search link for image 


website = urlread(weblink);
info = website;

http://images.google.com/search?num=10&hl=en&site=&tbm=isch&source=hp&biw=1115&bih=603&q=21+jump+street&oq=21+jump+street&gs_l=img.3..0l10.1158.3451.0.3626.14.4.0.10.10.0.71.211.4.4.0...0.0...1ac.1.1a5OVDBN1fs#hl=en&tbo=d&tbm=isch&sa=1&q=21+jump+street+movie+poster&oq=21+jump+street+movie+poster&gs_l=img.3..0.27545.29657.0.29782.13.7.0.6.6.0.67.384.7.7.0...0.0...1c.1.3-ubrWm7OM0&bav=on.2,or.r_gc.r_pw.r_qf.&bvm=bv.1355534169,d.dmQ&fp=b604bf12d93d2d55&bpcl=40096503&biw=1115&bih=603
    
http://images.google.com/search?num=10&hl=en&site=&tbm=isch&source=hp&biw=1115&bih=603&q=21+jump+street&oq=21+jump+street&gs_l=img.3..0l10.1158.3451.0.3626.14.4.0.10.10.0.71.211.4.4.0...0.0...1ac.1.1a5OVDBN1fs
