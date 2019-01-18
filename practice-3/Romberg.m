function I=Romberg(f,x,a,b,e)
%Romberg 求积函数
% I=Romberg(f,x,a,b,e)
% f为字符型，被积函数
% x为字符型，被积变量
% a为单值，积分下限
% b为单值，积分上限
% e为单值，精度要求
% I为积分的估计值

if ischar(f)==0||ischar(x)==0
    error('f and x must be character!');
    return;
end
if max(size(a))>1||max(size(b))>1||max(size(e))>1
    error('The size of a, b and e must be 1!');
    return;
end

T(1,1)=(b-a)/2*(subs(f,x,a)+subs(f,x,b));
T=double(T);

n=2;
h=b-a;
T(2,1)=T(1,1)/2+h/2*double(subs(f,x,a+h/2));
T(2,2)=4/3*T(2,1)-1/3*T(1,1);
d=abs(T(2,2)-T(1,1));
while d>e
    n=n+1;
    h=h/2;
    T(n,1)=T(n-1,1)/2;
    for i=1:2^(n-2)
        T(n,1)=T(n,1)+h/2*double(subs(f,x,a+(i-1/2)*h));
    end
    for i=2:n
        k=4^(i-1);
        T(n,i)=k/(k-1)*T(n,i-1)-1/(k-1)*T(n-1,i-1);
    end
    d=abs(T(n,n)-T(n-1,n-1));
end

I=T(n,n);
n=2^(n-1);