function  val =  ConvertPairs(temp)


if temp == 'j' || temp == 'q' || temp == 'k'
    val = 2;
elseif temp == 'a'
    val = 1;
elseif temp == '9'
    val = 3;
elseif temp == '8'
    val = 4;
elseif temp == '7'
    val = 5;
elseif temp == '6'
    val = 6;
elseif temp == '5'
    val = 7;
elseif temp == '4'
    val = 8;
elseif temp == '3'
    val = 9;
elseif temp == '2'
    val = 10;
end

end