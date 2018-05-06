function r = AESonFile( filename, key, decrypt)
fid = fopen(filename,'r');
fr = fread(fid);
fclose(fid);
if(~decrypt)
    fr = fr';
    y = PreProcess(fr);
    y = dec2hex(y);
    in = zeros(1,length(y)*2);
    in = dec2hex(in);
    in = in';
    for i = 1:length(y)
        in(2*i-1) = y(i,1);
        in(2*i) = y(i,2);
    end;
    padding = 32 - mod(length(in),32);
    for i =1:padding
        in(length(in)+1) = 'F';
    end;
    numRounds = length(in)/32;
    out = zeros(1,length(in));
elseif(decrypt)
	numRounds = length(fr)/32;
	out = zeros(1,length(fr));
end;
out = dec2hex(out);
out = out';
for i =1:numRounds
    fprintf('%d',i);
    out(32*i-31:32*i) = AES(in(32*i-31:32*i),key,decrypt);
end;
r = out;
