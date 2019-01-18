function yi=fenDuan(X,Y,xi)
% fenDuan ��ֵ����ʽ������
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
for i=1:n-1 %�����нڵ㰴X��������
    for j=i+1:n
        if X(i)>X(j)
            t=X(i);tt=Y(i);
            X(i)=X(j);Y(i)=Y(j);
            X(j)=t;Y(j)=tt;
        end
    end
end
for i=1:length(xi)%����ÿ�������Ƶ�
    for j=2:n %Ѱ�ұ����Ƶ���������
        if xi(i)<=X(j)
            x0=X(j-1);x1=X(j);%����˵�
            y0=Y(j-1);y1=Y(j);%����˵㺯��ֵ
            break;
        end
    end
    yi(i)=(xi(i)-x1)*y0/(x0-x1)+(xi(i)-x0)*y1/(x1-x0);%�������ֵ
end