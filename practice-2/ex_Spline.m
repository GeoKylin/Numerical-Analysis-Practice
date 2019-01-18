% Spline 插值的一个例子
clear
close all
clc
format short

X=[0 1.5708 3.1416 4.7124 6.2832];%插值多项式节点X值
Y=[0 1 0 -1 0];%插值多项式节点Y值
M=[0 0];%插值多项式边界条件
s=2;%插值多项式边界条件类型
xi=[0.31416 0.62832 0.94248 1.25664];%待插值点X值
yi=Spline(X,Y,M,xi,s)%计算待插值点Y值
Xi=min(min(X),min(xi)):0.01:max(max(X),max(xi));%绘制函数图像的X值
Yi=Spline(X,Y,M,Xi,s);%绘制插值多项式函数图像的Y值
YY=sin(Xi);%绘制原函数图像的Y值
figure;plot(X,Y,'o')%所有节点，圆圈
hold on;grid on
plot(Xi,Yi,'r--')%插值多项式函数图形，红色
plot(Xi,YY,'g')%原函数图形，绿色