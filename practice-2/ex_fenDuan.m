clear
close all
clc

X=[1 4 16 36 64 81];%插值多项式节点X值
Y=[1 2 4 6 8 9];%插值多项式节点Y值
xi=[25 49];%待插值点X值
yi=fenDuan(X,Y,xi)%计算待插值点Y值
Xi=min(min(X),min(xi)):0.1:max(max(X),max(xi));%绘制函数图像的X值
Yi=fenDuan(X,Y,Xi);%绘制插值多项式函数图像的Y值
YY=sqrt(Xi);%绘制原函数图像的Y值
figure;plot(X,Y,'o')%所有节点，圆圈
hold on;grid on
plot(Xi,Yi,'r--')%插值多项式函数图形，红色
plot(Xi,YY,'g')%原函数图形，绿色