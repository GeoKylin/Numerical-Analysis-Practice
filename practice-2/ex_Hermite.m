% �������� Hermite ��ֵ����ʽ��һ������
clear all
close all
clc

X=[1 4];%��ֵ����ʽ�ڵ�Xֵ
Y=[1 2];%��ֵ����ʽ�ڵ�Yֵ
M=[1/2 1/4];%��ֵ����ʽ�ڵ㵼��ֵ
xi=[2 3];%�������ֵ��Yֵ
yi=Hermite(X,Y,M,xi)%�������ֵ��Yֵ
Xi=min(min(X),min(xi)):0.1:max(max(X),max(xi));%���ƺ���ͼ���Xֵ
Yi=Hermite(X,Y,M,Xi);%���Ʋ�ֵ����ʽ����ͼ���Yֵ
YY=sqrt(Xi);%����ԭ����ͼ���Yֵ
figure;plot(X,Y,'o')%���нڵ㣬ԲȦ
hold on;grid on
plot(Xi,Yi,'r--')%��ֵ����ʽ����ͼ�Σ���ɫ
plot(Xi,YY,'g')%ԭ����ͼ�Σ���ɫ