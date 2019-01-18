function [G,d,fan,X,k,lan,rho]=Seidel(A,b,e,x0)
% Seidel迭代法解线性方程组

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

G=-inv(D+L)*U;
d=(D+L)\b;
fan=max(sum(abs(G),2));
[~,D]=eig(G);
lan=sum(D);
rho=max(abs(lan));

x(:,1)=G*x0+d;
ee=max(abs(x(:,1)-x0));
k=1;
while ee>=e
    k=k+1;
    x(:,k)=G*x(:,k-1)+d;
    ee=max(abs(x(:,k)-x(:,k-1)));
end
X=x(:,k);