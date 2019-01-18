function yi=Newton(X,Y,xi)
% Newton ��ֵ����ʽ������
% XΪ������ȫ���Ĳ�ֵ�ڵ㣻
% YΪ��������ֵ�ڵ㴦�ĺ���ֵ��
% xiΪ�����������ƺ����Ա�����
% yiΪ������xi���ĺ�������ֵ
n=length(X);m=length(Y);%X��Y����
if n~=m %����Ĳ�ֵ�������ĺ���ֵӦ����ͬ�ĸ���
    error('The lengths of X and Y must be equal!');%����
    return;
end
for i=1:n %����Ĳ�ֵ�ڵ���뻥��
    for j=i+1:n
        if abs(X(i)-X(j))<eps %���������ʶ��ľ���
            error('The data X must be unequal from each other!');%����
            return;
        end
    end
end
C=zeros(n,n);%��ʼ���������
C(1,1)=Y(1);
for i=2:n %����������
    C(i,1)=Y(i);
    for j=2:i
        C(i,j)=(C(i,j-1)-C(i-1,j-1))/(X(i)-X(i-j+1));
    end
end
k=length(xi);%�����Ƶ�ĸ���
for i=1:k %��i�������Ƶ�
    W(i,1)=1;%����ʽ��������
    P(i,1)=W(i,1)*C(1,1);%ÿ������ʽ
    for j=2:n %��j������ʽ
        W(i,j)=W(i,j-1)*(xi(i)-X(j-1));%����������
        P(i,j)=W(i,j)*C(j,j);%���㵥��ʽ
    end
    yi(i)=sum(P(i,:));%����ʽ���ӣ��������ֵ
end