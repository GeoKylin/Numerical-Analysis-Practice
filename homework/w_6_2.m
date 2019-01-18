clear
close all
clc
format short g

syms x;
f=1-x-sin(x);
a=0;
b=1;
e=1e-4;

X=Erfen(f,x,a,b,e)