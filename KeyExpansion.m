function r= KeyExpansion(key, Nk)
Nb = 4;
Nr = Nk+6;
for i = 0:(Nk-1)
    w((i+1),(1:8))=horzcat(key(8*i+1:8*i+2),key(8*i+3:8*i+4),key(8*i+5:8*i+6),key(8*i+7:8*i+8));
end;
for i = Nk:(Nb*(Nr+1)-1)
    temp = w(i,1:8);
    if mod( (i), Nk)==0
        temp = BitXOR(SubWord(RotWord(temp)),Rcon(i/Nk));
    elseif Nk > 6 & mod(i,Nk)==4
        temp = SubWord(temp);
    end;
    w(i+1,1:8) = BitXOR(w(i-Nk+1,1:8),temp);
end;
r =w;