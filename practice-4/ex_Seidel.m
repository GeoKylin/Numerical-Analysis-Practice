clear
close all
clc
format short g

A=[3 -1 1;3 6 2;3 3 7];                 %ϵ������
b=[1;0;4];                              %���������
e=1e-3;                                 %�����
x0=zeros(length(b),1);                  %��ʼֵ
[G,d,fan,X,k,lan,rho]=Seidel(A,b,e,x0)  %������