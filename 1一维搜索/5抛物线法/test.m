%测试抛物线法
syms x;
y = x.^4+2.*x+4; %p26 1.7
[best_x, best_fx]=paowuxianfa(y,x,-1/2,-1,0,0.01,0.01); %使用抛物线法求解 y为函数，x为函数y的变量，x1,x0,x2为已知的三点且满足f1>f0,精度为0.0000001
disp(vpa(best_x,3));
disp(vpa(best_fx,3));