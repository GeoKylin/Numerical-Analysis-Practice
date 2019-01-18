function I=Romberg(f,x,a,b,e)
%Romberg 求积函数
% I=Romberg(f,x,a,b,e)
% f为字符型，被积函数
% x为字符型，被积变量
% a为单值，积分下限
% b为单值，积分上限
% e为单值，精度要求
% I为积分的估计值
if ischar(f)==0||ischar(x)==0 %f、x应为字符型
    error('f and x must be character!');%报错提示
    return;
end
if max(size(a))>1||max(size(b))>1||max(size(e))>1 %a、b、e应为单值
    error('The size of a, b and e must be 1!');%报错
    return;
end
T(1,1)=(b-a)/2*(subs(f,x,a)+subs(f,x,b)); %用梯形公式计算T(1,1)
T=double(T); %转换为数值型
n=2; %n表示T矩阵行号
h=b-a; %步长赋值
T(2,1)=T(1,1)/2+h/2*double(subs(f,x,a+h/2)); %用变步长梯形公式计算T(2,1)
T(2,2)=4/3*T(2,1)-1/3*T(1,1); %用梯形加速公式计算T(2,2)
d=abs(T(2,2)-T(1,1)); %估计T(2,2)与真实值I的误差
while d>e %误差是否达到误差限
    n=n+1; %行号加1
    h=h/2; %步长赋值
    %%%%%%%%%%%% 用变步长梯形公式计算T(n,1) %%%%%%%%%%%%
    T(n,1)=T(n-1,1)/2; %计算首项
    for i=1:2^(n-2)
        T(n,1)=T(n,1)+h/2*double(subs(f,x,a+(i-1/2)*h)); %计算求和项
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=2:n
        k=4^(i-1);
        T(n,i)=k/(k-1)*T(n,i-1)-1/(k-1)*T(n-1,i-1); %用加速公式计算T(n,i)
    end
    d=abs(T(n,n)-T(n-1,n-1)); %估计T(n,n)与真实值I的误差
end
I=T(n,n); %求得积分估计值I