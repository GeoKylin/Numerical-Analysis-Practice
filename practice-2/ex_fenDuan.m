clear
close all
clc

X=[1 4 16 36 64 81];%��ֵ����ʽ�ڵ�Xֵ
Y=[1 2 4 6 8 9];%��ֵ����ʽ�ڵ�Yֵ
xi=[25 49];%����ֵ��Xֵ
yi=fenDuan(X,Y,xi)%�������ֵ��Yֵ
Xi=min(min(X),min(xi)):0.1:max(max(X),max(xi));%���ƺ���ͼ���Xֵ
Yi=fenDuan(X,Y,Xi);%���Ʋ�ֵ����ʽ����ͼ���Yֵ
YY=sqrt(Xi);%����ԭ����ͼ���Yֵ
figure;plot(X,Y,'o')%���нڵ㣬ԲȦ
hold on;grid on
plot(Xi,Yi,'r--')%��ֵ����ʽ����ͼ�Σ���ɫ
plot(Xi,YY,'g')%ԭ����ͼ�Σ���ɫ