function [B,g,fan,X,k,lan,rho]=Songchi(A,b,e,w,x0)
% 松弛迭代法解线性方程组

n=length(b);
D=zeros(n,n);
L=D;U=D;
D(1,1)=A(1,1);
for i=2:n
    D(i,i)=A(i,i);
    for j=1:i-1
        L(i,j)=A(i,j);
        U(j,i)=A(j,i);
    end
end

B=(D+w*L)\((1-w)*D-w*U);
g=w*((D+w*L)\b);
fan=max(sum(abs(B),2));
[~,D]=eig(B);
lan=sum(D);
rho=max(abs(lan));

x(:,1)=B*x0+g;
d=max(abs(x(:,1)-x0));
k=1;
while d>=e
    k=k+1;
    x(:,k)=B*x(:,k-1)+g;
    d=max(abs(x(:,k)-x(:,k-1)));
end
X=x(:,k);