function pushbutton1_Callback(hObject, eventdata, handles)%�����㡱��ť����Ӧ����
f=get(handles.edit3,'String');%��ȡ��������
x=get(handles.edit4,'String');%��ȡ��������
a=str2double(get(handles.edit2,'String'));%��ȡ��������
b=str2double(get(handles.edit1,'String'));%��ȡ��������
e=str2double(get(handles.edit6,'String'));%��ȡ�����
T(1,1)=(b-a)/2*(subs(f,x,a)+subs(f,x,b)); 		%�����ι�ʽ����T(1,1)
T=double(T); 									%ת��Ϊ��ֵ��
n=2; 											%n��ʾT�����к�
h=b-a; 											%������ֵ
T(2,1)=T(1,1)/2+h/2*double(subs(f,x,a+h/2)); 	%�ñ䲽�����ι�ʽ����T(2,1)
T(2,2)=4/3*T(2,1)-1/3*T(1,1); 					%�����μ��ٹ�ʽ����T(2,2)
d=abs(T(2,2)-T(1,1)); 							%����T(2,2)����ʵֵI�����
while d>e 										%����Ƿ�ﵽ�����
    n=n+1; 										%�кż�1
    h=h/2; 										%������ֵ
    %%%%%%%%%%%% �ñ䲽�����ι�ʽ����T(n,1) %%%%%%%%%%%%
    T(n,1)=T(n-1,1)/2; 										%��������
    for i=1:2^(n-2)
        T(n,1)=T(n,1)+h/2*double(subs(f,x,a+(i-1/2)*h)); 	%���������
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=2:n
        k=4^(i-1);
        T(n,i)=k/(k-1)*T(n,i-1)-1/(k-1)*T(n-1,i-1);		%�ü��ٹ�ʽ����T(n,i)
    end
    d=abs(T(n,n)-T(n-1,n-1)); 	%����T(n,n)����ʵֵI�����
end
I=T(n,n); 						%��û��ֹ���ֵI
en=fix(-(log10(e)))+1;          %��������ʾλ��
set(handles.edit5,'String',num2str(I,['%.' num2str(en) 'f'])); %������ֽ���ֵ