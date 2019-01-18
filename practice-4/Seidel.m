function [G,d,fan,X,k,lan,rho]=Seidel(A,b,e,x0)
% Seidel迭代法解线性方程组
%输入：
% A为系数矩阵；
% b为常数项矩阵；
% e为误差限；
% x0为初始值；
%输出：
% G为迭代格式中的系数矩阵；
% d为迭代格式中的常数项矩阵；
% fan为G矩阵的无穷大范数；
% X为近似解；
% k为迭代次数；
% lan为G矩阵的特征值；
% rho为G矩阵的谱半径。

n=length(b);                %n为方程个数
D=zeros(n,n);               %D为对角阵
L=D;U=D;                    %L为下三角阵，U为上三角阵
D(1,1)=A(1,1);
for i=2:n                   %为L、D、U矩阵赋值
    D(i,i)=A(i,i);
    for j=1:i-1
        L(i,j)=A(i,j);
        U(j,i)=A(j,i);
    end
end

G=-inv(D+L)*U;              %计算赛德尔迭代矩阵G
d=(D+L)\b;                  %计算常数项矩阵
fan=max(sum(abs(G),2));     %计算G矩阵无穷大范数
[~,D]=eig(G);
lan=sum(D);                 %计算G矩阵特征值
rho=max(abs(lan));          %计算G矩阵谱半径

x(:,1)=G*x0+d;              %第一次迭代近似解
ee=max(abs(x(:,1)-x0));     %估计误差
k=1;
while ee>=e                 %迭代法计算近似解
    k=k+1;
    x(:,k)=G*x(:,k-1)+d;
    ee=max(abs(x(:,k)-x(:,k-1)));
end
X=x(:,k);                   %得到近似解