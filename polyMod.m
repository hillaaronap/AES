function r = polyMod(a,b)
a = de2bi(a,'left-msb');
b = de2bi(b,'left-msb');
t = a;
t(1:length(b));
if(length(t) >= length(b))
    fo=0;
    while true
        temp = xor(t(1:length(b)),b);
        f = temp(1);        
        while f == 0 & fo+length(b) < length(a);
            temp(1:length(temp)) = horzcat(temp(2:length(temp)),0);
            fo= fo+1;
            f=temp(1);
        end;
        if f == 0 
            ret = temp ;
            break;
        else
            t = temp;
        end;
    end;
else
    ret = xor(a,b);
end;
r = bi2de(ret(2:length(ret)),'left-msb');