clear
close all
clc
format long

f='exp(-x)*sin(x)';
x='x';
a=0;
b=inf;
n=6;

I=Guass_Laguerre(f,x,a,b,n)