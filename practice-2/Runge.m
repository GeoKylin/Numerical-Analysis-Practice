% 龙格现象
clear
close all
clc

n1=5;%第一个插值多项式次数
n2=10;%第二个插值多项式次数
X1=-5:10/n1:5;%第一个插值多项式节点X值
X2=-5:10/n2:5;%第二个插值多项式节点X值
Xi=-5:0.1:5;%原函数X值
% Y1=(1+X1.^2).^(-1); Y2=(1+X2.^2).^(-1); YY=(1+Xi.^2).^(-1);%实验函数1
% Y1=(1+X1.^4).^(-1); Y2=(1+X2.^4).^(-1); YY=(1+Xi.^4).^(-1);%实验函数2
% Y1=exp(-X1.^2); Y2=exp(-X2.^2); YY=exp(-Xi.^2);%实验函数3
Y1=2.^(-(X1.^2).^(1/3)); Y2=2.^(-(X2.^2).^(1/3)); YY=2.^(-(Xi.^2).^(1/3));%实验函数4
Yi1=Lagrange(X1,Y1,Xi);%第一个插值多项式在整个区间上的函数值
Yi2=Lagrange(X2,Y2,Xi);%第二个插值多项式在整个区间上的函数值
figure;
plot(Xi,Yi1,'g--')%第一个插值多项式函数图形，绿色
hold on;grid on
plot(Xi,Yi2,'r-.')%第二个插值多项式函数图形，红色
plot(Xi,YY,'k')%原函数图形，黑色