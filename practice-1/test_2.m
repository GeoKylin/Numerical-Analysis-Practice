N=10000000;

s1(1,1)=1;
sgn=1;
for i=2:N 
    sgn=sgn*(-1);
    s1(1,i)=s1(1,i-1)+sgn/i;
end
s_1=s1(1,N)
%1.333s