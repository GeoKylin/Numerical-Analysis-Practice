clear
close all
clc
format short g

A=[5 2 0;-1 4 2;2 -3 10];               %ϵ������
b=[3;-3;15];                            %���������
e=1e-4;                                 %�����
x0=zeros(length(b),1);                  %��ʼֵ
[B,f,fan,X,k,lan,rho]=Jacobi(A,b,e,x0)  %������