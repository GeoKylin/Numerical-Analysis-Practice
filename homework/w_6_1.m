clear
close all
clc
format short

syms x;
f=x^3-2*x-5;
a=2;
b=3;
e=0.001;

X=Erfen(f,x,a,b,e)