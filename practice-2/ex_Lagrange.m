% lagrange插值的一个例子
clear all;clc

x=[1 4 9];%插值多项式节点X值
y=[1 2 3];%插值多项式节点Y值
xi=[5,6];%待插值点X值
yi=Lagrange(x,y,xi)%计算待插值点Y值
xi=1:0.1:10;%绘制函数图像的X值
yi=Lagrange(x,y,xi);%绘制插值多项式函数图像的Y值
yy=sqrt(xi);%绘制原函数图像的Y值
figure;plot(x,y,'o')%所有节点，圆圈
hold on;grid on
plot(xi,yi,'r--')%插值多项式函数图形，红色
plot(xi,yy,'g')%原函数图形，绿色