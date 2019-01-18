clear
close all
clc

s=0;
for k=0:9
    s=s+4/(1+(k+1/2)/10);
end
for k=1:9
    s=s+2/(1+k/10);
end
s=1/60*(3/2+s);
s=vpa(s)