%平分法。根据最优化方法（天津大学出版社）21页算法1.4.4编写。
% st_x为最优的x值，best_fx为最优的函数值，y为函数，x为函数y的变量，a,b为下单峰区间[a,b],epsilon为精确度
%当保留的区间长度|b-a|<=epsilon时停止迭代
function [best_x ,best_fx]=ErFen(y,x,a,b,epsilon)

if nargin==4
    epsilon=0.0000001;%设置默认的epsilon
end

if a>b    %保证a<b
    c=a;
    a=b;
    b=c;  
end
dy=diff(y);
c=(a+b)/2;  %step1
while ( b-a>epsilon)
fc=subs(dy,x,c);
if(fc==0)
    break;
end
if (fc<0)
    a=c;
    c=(a+b)/2;
end
if (fc>0)
    b=c;
    c=(a+b)/2;
end
end



best_x=c;%最优的x值
best_fx=subs(y,x,c);%最优的函数值
end