function yi=Hermite(X,Y,M,xi)
% �������� Hermite ��ֵ����ʽ������
% XΪ������ȫ���Ĳ�ֵ�ڵ㣻
% YΪ��������ֵ�ڵ㴦�ĺ���ֵ��
% MΪ��������ֵ�㴦�ĵ���ֵ��
% xiΪ�����������ƺ����Ա�����
% yiΪ������xi���ĺ�������ֵ��
n=length(X);m=length(Y);k=length(M);%X��Y��M�ĳ���
if n==2&&m==2&&k==2 %X��Y��M�ĳ���ӦΪ2
    for i=1:n %����Ĳ�ֵ�ڵ���뻥��
        for j=i+1:n
            if abs(X(i)-X(j))<eps %���������ʶ��ľ���
                error('The data X must be unequal from each other!');%����
                return;
            end
        end
    end
    for i=1:length(xi) %����ÿ�������Ƶ�Ĳ����ͺ���ֵ
        a0(i)=(1+2*(xi(i)-X(1))/(X(2)-X(1)))*((xi(i)-X(2))/(X(1)-X(2)))^2;%����a0
        a1(i)=(1+2*(xi(i)-X(2))/(X(1)-X(2)))*((xi(i)-X(1))/(X(2)-X(1)))^2;%����a1
        b0(i)=(xi(i)-X(1))*((xi(i)-X(2))/(X(1)-X(2)))^2;%����b0
        b1(i)=(xi(i)-X(2))*((xi(i)-X(1))/(X(2)-X(1)))^2;%����b1
        yi(i)=Y(1)*a0(i)+Y(2)*a1(i)+M(1)*b0(i)+M(2)*b1(i);%����ֵ
    end    
else
    error('The lengths of X, Y and M must be 2!');%����
    return;
end