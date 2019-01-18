function I=Romberg(f,x,a,b,e)
%Romberg �������
% I=Romberg(f,x,a,b,e)
% fΪ�ַ��ͣ���������
% xΪ�ַ��ͣ���������
% aΪ��ֵ����������
% bΪ��ֵ����������
% eΪ��ֵ������Ҫ��
% IΪ���ֵĹ���ֵ
if ischar(f)==0||ischar(x)==0 %f��xӦΪ�ַ���
    error('f and x must be character!');%������ʾ
    return;
end
if max(size(a))>1||max(size(b))>1||max(size(e))>1 %a��b��eӦΪ��ֵ
    error('The size of a, b and e must be 1!');%����
    return;
end
T(1,1)=(b-a)/2*(subs(f,x,a)+subs(f,x,b)); %�����ι�ʽ����T(1,1)
T=double(T); %ת��Ϊ��ֵ��
n=2; %n��ʾT�����к�
h=b-a; %������ֵ
T(2,1)=T(1,1)/2+h/2*double(subs(f,x,a+h/2)); %�ñ䲽�����ι�ʽ����T(2,1)
T(2,2)=4/3*T(2,1)-1/3*T(1,1); %�����μ��ٹ�ʽ����T(2,2)
d=abs(T(2,2)-T(1,1)); %����T(2,2)����ʵֵI�����
while d>e %����Ƿ�ﵽ�����
    n=n+1; %�кż�1
    h=h/2; %������ֵ
    %%%%%%%%%%%% �ñ䲽�����ι�ʽ����T(n,1) %%%%%%%%%%%%
    T(n,1)=T(n-1,1)/2; %��������
    for i=1:2^(n-2)
        T(n,1)=T(n,1)+h/2*double(subs(f,x,a+(i-1/2)*h)); %���������
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=2:n
        k=4^(i-1);
        T(n,i)=k/(k-1)*T(n,i-1)-1/(k-1)*T(n-1,i-1); %�ü��ٹ�ʽ����T(n,i)
    end
    d=abs(T(n,n)-T(n-1,n-1)); %����T(n,n)����ʵֵI�����
end
I=T(n,n); %��û��ֹ���ֵI