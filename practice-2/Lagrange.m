function yi=Lagrange(x,y,xi)
% Lagrange ��ֵ����ʽ������
% xΪ������ȫ���Ĳ�ֵ�ڵ㣻
% yΪ��������ֵ�ڵ㴦�ĺ���ֵ��
% xiΪ�����������ƺ����Ա�����
% yiΪ������xi���ĺ�������ֵ
n=length(x);m=length(y);%X��Y����
if n~=m % ����Ĳ�ֵ�������ĺ���ֵӦ����ͬ�ĸ���
    error('The lengths of X and Y must be equal!');%����
    return;
end
for jj=1:length(xi)%��ÿ�������ƺ����Ա���������
    p=zeros(1,n);%����ʽ��ʼ��
    for k=1:n%����ÿ������ʽ
        t=ones(1,n);%����ʽ����ʽ��ʼ��
        for j=1:n%����ÿ����ʽ
            if j~=k%����Ĳ�ֵ�ڵ���뻥��
                if abs(x(k)-x(j))<eps
                    error('the DATA is error');%����
                    return
                end
                t(j)=(xi(jj)-x(j))/(x(k)-x(j));%������ʽ
            end
        end
        p(k)=prod(t);%���㵥��ʽ
    end
    yi(jj)=sum(y.*p);%���㺯������ֵ
end