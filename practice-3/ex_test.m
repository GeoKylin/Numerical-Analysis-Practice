function pushbutton1_Callback(hObject, eventdata, handles)%“计算”按钮的响应函数
f=get(handles.edit3,'String');%读取被积函数
x=get(handles.edit4,'String');%读取被积变量
a=str2double(get(handles.edit2,'String'));%读取积分下限
b=str2double(get(handles.edit1,'String'));%读取积分上限
e=str2double(get(handles.edit6,'String'));%读取误差限
T(1,1)=(b-a)/2*(subs(f,x,a)+subs(f,x,b)); 		%用梯形公式计算T(1,1)
T=double(T); 									%转换为数值型
n=2; 											%n表示T矩阵行号
h=b-a; 											%步长赋值
T(2,1)=T(1,1)/2+h/2*double(subs(f,x,a+h/2)); 	%用变步长梯形公式计算T(2,1)
T(2,2)=4/3*T(2,1)-1/3*T(1,1); 					%用梯形加速公式计算T(2,2)
d=abs(T(2,2)-T(1,1)); 							%估计T(2,2)与真实值I的误差
while d>e 										%误差是否达到误差限
    n=n+1; 										%行号加1
    h=h/2; 										%步长赋值
    %%%%%%%%%%%% 用变步长梯形公式计算T(n,1) %%%%%%%%%%%%
    T(n,1)=T(n-1,1)/2; 										%计算首项
    for i=1:2^(n-2)
        T(n,1)=T(n,1)+h/2*double(subs(f,x,a+(i-1/2)*h)); 	%计算求和项
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=2:n
        k=4^(i-1);
        T(n,i)=k/(k-1)*T(n,i-1)-1/(k-1)*T(n-1,i-1);		%用加速公式计算T(n,i)
    end
    d=abs(T(n,n)-T(n-1,n-1)); 	%估计T(n,n)与真实值I的误差
end
I=T(n,n); 						%求得积分估计值I
en=fix(-(log10(e)))+1;          %计算结果显示位数
set(handles.edit5,'String',num2str(I,['%.' num2str(en) 'f'])); %输出积分近似值