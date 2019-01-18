clear
close all
clc
format long

f='exp(x)';
x='x';
a=0;
b=1;
e=1e-3;

I=Romberg(f,x,a,b,e)