function r = InvSubBytes(s)
for i=1:4
    t(i,1:8) = InvSubWord(s(i,1:8));
end;
r=t;