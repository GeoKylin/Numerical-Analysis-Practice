clear
close all
clc

A=[5 2 0;...
    -1 4 2;...
    2 -3 10];
b=[3;-3;15];
e=1e-4;
x0=zeros(length(b),1);

format rat
[B,f,~]=Jacobi(A,b,e,x0)
format long
[~,~,fan,X,k]=Jacobi(A,b,e,x0)

format rat
[G,d,~]=Seidel(A,b,e,x0)
format long
[~,~,fan,X,k]=Seidel(A,b,e,x0)