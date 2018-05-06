% in: 128 bits as string of Hexadecimal characters
% key 128, 192, or 256 bits as string of Hexadecimal characters
% decrypt: boolean. true for decrypt, false for encrypt
% 
function out = AES(in, key, decrypt)
if length(in) ~= 32 
    fprintf('ERROR: AES requires 128 bit input\n')
    return;
end;
if ~ ( length(key) == 32 || length(key) == 48 || length(key) == 64)
    fprintf('Warning: Only keys of length 128, 192, & 256 are supported\n')
end;
%inBin = hexToBinaryVector(in, length(in)*4);
keyLength = length(key);
%keyBin = hexToBinaryVector(key, keyLength*4);
%whos
Nk = keyLength/8; 
Nb = 4;
Nr = Nk + 6;
k = KeyExpansion( key, Nk);
state = [in(1:2),in(9:10),in(17:18),in(25:26);
        in(3:4),in(11:12),in(19:20),in(27:28);
        in(5:6),in(13:14),in(21:22),in(29:30);
        in(7:8),in(15:16),in(23:24),in(31:32)];
if ~decrypt
    %Encrypt with AES
    fprintf('Running Encryption with %d bit key\n', keyLength*4);
    state = AddRoundKey(state, k(1:4, 1:8));
    for round = 1:(Nr-1)
        state = SubBytes(state);
        state = ShiftRows(state);
        state = MixColumns(state);
        state = AddRoundKey(state, k(round*4+1:round*4+4,1:8));
    end;
    state = SubBytes(state);
    state = ShiftRows(state);
    state = AddRoundKey(state, k(Nr*4+1:Nr*4+4,1:8));
elseif decrypt
    %Decrypt with AES
    fprintf('Running Decryption with %d bit key\n', keyLength*4)
    state = AddRoundKey(state, k(Nr*4+1:Nr*4+4,1:8));
    for round = (Nr-1):-1:1
        state = InvShiftRows(state);
        state = InvSubBytes(state);
        state = AddRoundKey(state, k(round*4+1:round*4+4,1:8));
        state = InvMixColumns(state);
    end
    state = InvShiftRows(state);
    state = InvSubBytes(state);
    state = AddRoundKey(state, k(1:4, 1:8));
end;
for it = 0:2:6
    ret(it+1:it+2) = state(it/2 + 1,1:2);
    ret(it+9:it+10) = state(it/2 + 1,3:4);
    ret(it+17:it+18) = state(it/2+1,5:6);
    ret(it+25:it+26) = state(it/2+1,7:8);
end;
out = ret;
