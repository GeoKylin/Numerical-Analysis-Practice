% Spline ��ֵ��һ������
clear
close all
clc
format short

X=[0 1.5708 3.1416 4.7124 6.2832];%��ֵ����ʽ�ڵ�Xֵ
Y=[0 1 0 -1 0];%��ֵ����ʽ�ڵ�Yֵ
M=[0 0];%��ֵ����ʽ�߽�����
s=2;%��ֵ����ʽ�߽���������
xi=[0.31416 0.62832 0.94248 1.25664];%����ֵ��Xֵ
yi=Spline(X,Y,M,xi,s)%�������ֵ��Yֵ
Xi=min(min(X),min(xi)):0.01:max(max(X),max(xi));%���ƺ���ͼ���Xֵ
Yi=Spline(X,Y,M,Xi,s);%���Ʋ�ֵ����ʽ����ͼ���Yֵ
YY=sin(Xi);%����ԭ����ͼ���Yֵ
figure;plot(X,Y,'o')%���нڵ㣬ԲȦ
hold on;grid on
plot(Xi,Yi,'r--')%��ֵ����ʽ����ͼ�Σ���ɫ
plot(Xi,YY,'g')%ԭ����ͼ�Σ���ɫ