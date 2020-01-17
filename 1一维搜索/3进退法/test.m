%进退法测试 test
syms x;
y = x.^4+2.*x+4; %p26 1.7
[left right] = jintuifa(y,x,-1); %使用进退法求解 y为函数，x为函数y的变量，x0为初始点