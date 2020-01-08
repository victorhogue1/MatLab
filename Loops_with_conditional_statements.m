
clc
clear
format compact
%Use m = 10, 100, 1000
for i = 1:3
    m = input('\nEnter m: ');
    s = 0;
    for n = 0:m
        s = s + 1/((2*n+1)*(2*n+2));
    end
    val = log(2);
    absdiff = abs(s - val);
    if (absdiff >= .01)
        disp('far apart')
    elseif ((absdiff >= .001)&&(absdiff < .01))
        disp('getting close')
    elseif (absdiff < .001)
        disp('close enough')
    end
end
            