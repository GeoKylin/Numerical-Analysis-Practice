clear
close all
clc
format short g

A=[5 2 0;-1 4 2;2 -3 10];               %系数矩阵
b=[3;-3;15];                            %常数项矩阵
e=1e-4;                                 %误差限
x0=zeros(length(b),1);                  %初始值
[B,f,fan,X,k,lan,rho]=Jacobi(A,b,e,x0)  %输出结果