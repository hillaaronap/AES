function r = InvMixColumns(s)
for i= 0:3
    t(i+1,1:8) = [s(1,2*i+1:2*i+2),s(2,2*i+1:2*i+2),s(3,2*i+1:2*i+2),s(4,2*i+1:2*i+2)];
end;
for j = 1:4
    a = GaloisMultLU(t(j,1:2),14);
    a = hexToBinaryVector(a,8);
    b = GaloisMultLU(t(j,3:4),11);
    b = hexToBinaryVector(b,8);
    c = GaloisMultLU(t(j,5:6),13);
    c = hexToBinaryVector(c,8);
    d = GaloisMultLU(t(j,7:8), 9);
    d = hexToBinaryVector(d,8);
    e = xor(a,b);
    e = xor(e,c);
    e = xor(e,d);
    ret(1,2*j-1:2*j) = binaryVectorToHex(e);
    
     a = GaloisMultLU(t(j,1:2),9);
    a = hexToBinaryVector(a,8);
    b = GaloisMultLU(t(j,3:4),14);
    b = hexToBinaryVector(b,8);
    c = GaloisMultLU(t(j,5:6),11);
    c = hexToBinaryVector(c,8);
    d = GaloisMultLU(t(j,7:8), 13);
    d = hexToBinaryVector(d,8);
    e = xor(a,b);
    e = xor(e,c);
    e = xor(e,d);
    ret(2,2*j-1:2*j) = binaryVectorToHex(e);
    
    a = GaloisMultLU(t(j,1:2),13);
    a = hexToBinaryVector(a,8);
    b = GaloisMultLU(t(j,3:4),9);
    b = hexToBinaryVector(b,8);
    c = GaloisMultLU(t(j,5:6),14);
    c = hexToBinaryVector(c,8);
    d = GaloisMultLU(t(j,7:8), 11);
    d = hexToBinaryVector(d,8);
    e = xor(a,b);
    e = xor(e,c);
    e = xor(e,d);
    ret(3,2*j-1:2*j) = binaryVectorToHex(e);
    
     a = GaloisMultLU(t(j,1:2),11);
    a = hexToBinaryVector(a,8);
    b = GaloisMultLU(t(j,3:4),13);
    b = hexToBinaryVector(b,8);
    c = GaloisMultLU(t(j,5:6),9);
    c = hexToBinaryVector(c,8);
    d = GaloisMultLU(t(j,7:8), 14);
    d = hexToBinaryVector(d,8);
    e = xor(a,b);
    e = xor(e,c);
    e = xor(e,d);
    ret(4,2*j-1:2*j) = binaryVectorToHex(e);
end;
r = ret;