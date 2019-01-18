function [G,d,fan,X,k,lan,rho]=Seidel(A,b,e,x0)
% Seidel�����������Է�����
%���룺
% AΪϵ������
% bΪ���������
% eΪ����ޣ�
% x0Ϊ��ʼֵ��
%�����
% GΪ������ʽ�е�ϵ������
% dΪ������ʽ�еĳ��������
% fanΪG��������������
% XΪ���ƽ⣻
% kΪ����������
% lanΪG���������ֵ��
% rhoΪG������װ뾶��

n=length(b);                %nΪ���̸���
D=zeros(n,n);               %DΪ�Խ���
L=D;U=D;                    %LΪ��������UΪ��������
D(1,1)=A(1,1);
for i=2:n                   %ΪL��D��U����ֵ
    D(i,i)=A(i,i);
    for j=1:i-1
        L(i,j)=A(i,j);
        U(j,i)=A(j,i);
    end
end

G=-inv(D+L)*U;              %�������¶���������G
d=(D+L)\b;                  %���㳣�������
fan=max(sum(abs(G),2));     %����G�����������
[~,D]=eig(G);
lan=sum(D);                 %����G��������ֵ
rho=max(abs(lan));          %����G�����װ뾶

x(:,1)=G*x0+d;              %��һ�ε������ƽ�
ee=max(abs(x(:,1)-x0));     %�������
k=1;
while ee>=e                 %������������ƽ�
    k=k+1;
    x(:,k)=G*x(:,k-1)+d;
    ee=max(abs(x(:,k)-x(:,k-1)));
end
X=x(:,k);                   %�õ����ƽ�