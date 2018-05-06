function r = BitXOR(a,b)
tempa = hexToBinaryVector(a,32);
tempb = hexToBinaryVector(b,32);
tempc = xor(tempa,tempb);
r = binaryVectorToHex(tempc);
