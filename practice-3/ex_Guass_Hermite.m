clear
close all
clc
format long

f='exp(-x^2)*(sin(x))^2';
x='x';
a=-inf;
b=inf;
n=6;

I=Guass_Hermite(f,x,a,b,n)