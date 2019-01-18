clear
close all
clc

A=[3 -1 1;...
    3 6 2;...
    3 3 7];
b=[1;0;4];
e=1e-3;
x0=zeros(length(b),1);

format rat
[G,d,fan,~]=Seidel(A,b,e,x0)
format long
[~,~,~,X,k,lan,rho]=Seidel(A,b,e,x0)