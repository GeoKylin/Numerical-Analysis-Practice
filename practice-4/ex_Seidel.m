clear
close all
clc
format short g

A=[3 -1 1;3 6 2;3 3 7];                 %系数矩阵
b=[1;0;4];                              %常数项矩阵
e=1e-3;                                 %误差限
x0=zeros(length(b),1);                  %初始值
[G,d,fan,X,k,lan,rho]=Seidel(A,b,e,x0)  %输出结果