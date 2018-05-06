function r = AddRoundKey(s, k)
roundKey = [k(1,1:2),k(2,1:2),k(3,1:2),k(4,1:2);
        k(1,3:4),k(2,3:4),k(3,3:4),k(4,3:4);
        k(1,5:6),k(2,5:6),k(3,5:6),k(4,5:6);
        k(1,7:8),k(2,7:8),k(3,7:8),k(4,7:8);];
for i = 1:4
    ret(i,1:8)= BitXOR(s(i,1:8),roundKey(i,1:8));
end
r=ret;