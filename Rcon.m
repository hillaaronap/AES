function r = Rcon(i)
val = 2^(i-1);
if ( val > 255 )
   val = polyMod(val,283);
end;
temp(1:2) = dec2hex(val,2);
temp(3:8) = dec2hex(0,6);
r = temp(1:8);
