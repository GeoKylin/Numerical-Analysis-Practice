% lagrange��ֵ��һ������
clear all;clc

x=[1 4 9];%��ֵ����ʽ�ڵ�Xֵ
y=[1 2 3];%��ֵ����ʽ�ڵ�Yֵ
xi=[5,6];%����ֵ��Xֵ
yi=Lagrange(x,y,xi)%�������ֵ��Yֵ
xi=1:0.1:10;%���ƺ���ͼ���Xֵ
yi=Lagrange(x,y,xi);%���Ʋ�ֵ����ʽ����ͼ���Yֵ
yy=sqrt(xi);%����ԭ����ͼ���Yֵ
figure;plot(x,y,'o')%���нڵ㣬ԲȦ
hold on;grid on
plot(xi,yi,'r--')%��ֵ����ʽ����ͼ�Σ���ɫ
plot(xi,yy,'g')%ԭ����ͼ�Σ���ɫ