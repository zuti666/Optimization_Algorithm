%黄金分割法。根据最优化方法（天津大学出版社）17页算法1.4.2编写。
% st_x为最优的x值，best_fx为最优的函数值，y为函数，x为函数y的变量，a,b为下单峰区间[a,b],epsilon为精确度
%当保留的区间长度|b-a|<=epsilon时停止迭代
function [best_x ,best_fx]=golddiv(y,x,a,b,epsilon)

if nargin==4
    epsilon=0.0000001;%设置默认的epsilon
end

k=1;%记录迭代次数

x2=a+0.618*(b-a);%step1
f2=subs(y,x,x2);

x1=a+0.382*(b-a);%step2
f1=subs(y,x,x1);

while(abs(b-a)>epsilon)
    if f1<f2
        b=x2;x2=x1;f2=f1;
        x1=a+0.382*(b-a); %转step2
        f1=subs(y,x,x1);
    elseif f1==f2
        a=x1;b=x2;
        x2=a+0.618*(b-a);f2=subs(y,x,x2);%转step1
        x1=a+0.382*(b-a);f1=subs(y,x,x1);
    else
        a=x1;x1=x2;f1=f2;
        x2=a+0.618*(b-a);%step5
        f2=subs(y,x,x2);
    end
    
    k=k+1; 
    disp("迭代次数");
    disp(k);
    disp("区间");
    disp(a);disp(b);
    
end%while
best_x=(a+b)/2;%最优的x值
best_fx=subs(y,x,best_x);%最优的函数值
end