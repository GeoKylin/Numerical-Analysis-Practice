clear
close all
clc

A=[1 0.4 0.5;...
    0.4 1 0.8;...
    0.4 0.8 1];
b=[1;2;4];
e=1e-4;
x0=zeros(length(b),1);

format short g
[B_J,~,fan_J,~,~,lan_J,rho_J]=Jacobi(A,b,e,x0)
[B_S,~,fan_S,~]=Seidel(A,b,e,x0)