clear
close all
clc

A=[1 2 -2;...
    1 1 1;...
    2 2 1];
b=[7;2;5];
e=1e-4;
x0=zeros(length(b),1);

format short g
[B_J,~,fan_J,~,~,lan_J,rho_J]=Jacobi(A,b,e,x0)
[B_S,~,fan_S,~,~,lan_S,rho_S]=Seidel(A,b,e,x0)