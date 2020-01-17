%进退法，用于确定下单峰区间.根据最优化方法（天津大学出版社）20页算法1.4.3编写。
%[left right]为下单峰区间，y为函数，x为函数y的变量，x0为初始点（默认为0）,step（>0）为初始步长（默认为0.01）
function [left, right] = jintuifa(y,x,x0,step)
if nargin==3%当只有三个参数时，默认设置步长为0.01
    step=0.01;
end
if nargin==2
    x0=0;%当只有两个参数时，默认设置初始点为0
    step=0.01;
end

f0=subs(y,{x},{x0});%step1 求f(x0) 将函数y中变量x替换为x0
x1=x0+step;%step2
f1=subs(y,{x},{x1});

if (f1<=f0)%step3 step4
    step=2*step;
    x2=x1+step;
    f2=subs(y,{x},{x2});
    while(f1>f2)
        x0=x1; x1=x2;
        f0=f1; f1=f2;
        step=2*step;
        x2=x1+step;
        f2=subs(y,{x},{x2});
    end
    left=x0
    right=x2
else%step5 step6
    step=2*step;
    x2=x1-step;
    f2=subs(y,{x},{x2});
    while(f0>f2)
        x1=x0; x0=x2;
        f1=f0; f0=f2;
        step=2*step;
        x2=x1-step;
        f2=subs(y,{x},{x2});
    end
    left=x2;right=x1;
end