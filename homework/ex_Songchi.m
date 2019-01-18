clear
close all
clc

A=[3 -1 1;...
    3 6 2;...
    3 3 7];
b=[1;0;4];
e=1e-3;
w=1.2;
x0=zeros(length(b),1);

format short g
% format rat
[B,g,fan,X,k,lan,rho]=Songchi(A,b,e,w,x0)