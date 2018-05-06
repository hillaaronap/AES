function r = SubBytes(s)
for i=1:4
    t(i,1:8) = SubWord(s(i,1:8));
end;
r = t;