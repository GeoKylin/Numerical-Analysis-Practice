clear all
close all
clc
format long

N=13;                %��������
n=0:N;              %���ڻ�������
i=1-exp(-1)
j=exp(-1)/10
k=1/10
l=(j+k)/2

format short

IA(1,1)=0.63212056;     %�㷨5.3�ĳ�ʼֵ 0.632120558828558
for i=2:N+1
    IA(1,i)=1-(i-1)*IA(1,i-1);  %��������I
end
IA                  %���IA
figure;plot(n,IA,'r')   %����IA��������ͼ

IB(1,N+1)=0.1;   %�㷨5.4�ĳ�ʼֵ
for i=N:-1:1
   IB(1,i)=(1-IB(1,i+1))/i;     %��������I
end
IB                  %���IB
hold on;plot(n,IB,'k--')  %��ͬһ��ͼ�ϻ���IB��������ͼ