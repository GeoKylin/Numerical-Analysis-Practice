function yi=Spline(X,Y,M,xi,s)
% Spline ��ֵ����ʽ������
%  XΪ������ȫ���Ĳ�ֵ�ڵ㣻
%  YΪ��������ֵ�ڵ㴦�ĺ���ֵ��
%  MΪ�������߽�����������������ֵ��
% xiΪ�����������ƺ����Ա�����
%  sΪ������1��ʾ��һ��߽�������2��ʾ�ڶ���߽�������
% yiΪ������xi���ĺ�������ֵ
n=length(X);%X�ĳ���
if length(Y)~=n %����Ĳ�ֵ�������ĺ���ֵӦ����ͬ�ĸ���
    error('The lengths of X and Y must be equal!');%����
    return;
elseif length(M)~=2 %M�ĳ���ӦΪ2
    error('The length of M must be 2!');%����
    return;
elseif s~=1&&s~=2 %s��ֵӦΪ1��2
    error('s must be 1 or 2!');%����
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
for i=2:n
    h(i-1)=X(i)-X(i-1);%����h(i)
    c(i-1)=(Y(i)-Y(i-1))/h(i-1);%�������c(i)
end
for i=1:n-2
    u(i)=h(i)/(h(i)+h(i+1));%����u(i)
    r(i)=1-u(i);%����r(i)
    g(i+1)=6*(c(i+1)-c(i))/(h(i)+h(i+1));%����g(i)
end
if s==1 %��һ��߽�����
    g(1)=6*(c(1)-M(1))/h(1);
    g(n)=6*(M(2)-c(n-1))/h(n-1);
    A=zeros(n,n);%��ʼ��ϵ������
    A(1,1)=2;A(1,2)=1;
    A(n,n-1)=1;A(n,n)=2;
    for i=2:n-1%ϵ������ֵ
        A(i,i-1)=u(i-1);
        A(i,i)=2;
        A(i,i+1)=r(i-1);
    end
    for i=1:n%��ֵ���������
        G(i,1)=g(i);
    end
    m=A\G;%���m
else  %�ڶ���߽�����
    m(1)=M(1);m(n)=M(2);
    A=zeros(n-2,n-2);%��ʼ��ϵ������
    A(1,1)=2;A(1,2)=r(1);
    A(n-2,n-3)=u(n-2);A(n-2,n-2)=2;
    for i=2:n-3%ϵ������ֵ
        A(i,i-1)=u(i);
        A(i,i)=2;
        A(i,i+1)=r(i);
    end
    gg(1)=g(2)-u(1)*M(1);gg(n-2)=g(n-1)-r(n-2)*M(2);
    for i=1:n-4
        gg(i+1)=g(i+2);
    end
    for i=1:n-2%��ֵ���������
        G(i,1)=gg(i);
    end
    mm=A\G;
    m(2:n-1)=mm;%���m
end
for i=1:length(xi)%����ÿ�������Ƶ�
    for j=2:n %Ѱ�ұ����Ƶ���������
        if xi(i)<=X(j)
            x0=X(j-1);x1=X(j);%����˵�
            m0=m(j-1);m1=m(j);%����˵���׵���ֵ
            y0=Y(j-1);y1=Y(j);%����˵㺯��ֵ
            h1=h(j-1);%���䳤��
            break;
        end
    end
    yi(i)=(m0*((x1-xi(i))^3)/(6*h1))+(m1*((xi(i)-x0)^3)/(6*h1))+...
        ((y0-m0*(h1^2)/6)*(x1-xi(i))/h1)+((y1-m1*(h1^2)/6)*(xi(i)-x0)/h1);%�������ֵ
end