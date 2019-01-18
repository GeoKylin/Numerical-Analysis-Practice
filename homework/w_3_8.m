clear
close all
clc

syms A0 A1 x0 x1
[A0,A1,x0,x1]=solve('A0+A1=2/3','A0*x0+A1*x1=2/5','A0*x0^2+A1*x1^2=2/7',...
    'A0*x0^3+A1*x1^3=2/9','A0','A1','x0','x1');
A0=double(A0)
A1=double(A1)
x0=double(x0)
x1=double(x1)