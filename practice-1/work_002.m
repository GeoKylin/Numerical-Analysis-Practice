clear all
close all
clc
format long

N=13;                %迭代次数
n=0:N;              %用于绘制坐标
i=1-exp(-1)
j=exp(-1)/10
k=1/10
l=(j+k)/2

format short

IA(1,1)=0.63212056;     %算法5.3的初始值 0.632120558828558
for i=2:N+1
    IA(1,i)=1-(i-1)*IA(1,i-1);  %迭代计算I
end
IA                  %输出IA
figure;plot(n,IA,'r')   %绘制IA迭代过程图

IB(1,N+1)=0.1;   %算法5.4的初始值
for i=N:-1:1
   IB(1,i)=(1-IB(1,i+1))/i;     %迭代计算I
end
IB                  %输出IB
hold on;plot(n,IB,'k--')  %在同一张图上绘制IB迭代过程图