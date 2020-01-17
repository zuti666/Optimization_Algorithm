%由最优化 p111 算法3.4.2编制FR共轭梯度法  使用精确一维搜索方法为解二次函数 
%%
clc; clear 
syms x y t ;
x0=[2,2];%初始值
k=1;%记录迭代次数
epsion = 0.00001; %精确度控制
f=x.^2+y.^2-x*y+2*x-4*y;;%带求函数例3.4.1 3/2*x1^2+1/2*y^2-x*y-2*x
%%
dfx=diff(f,x);  % step2
dfy=diff(f,y);
df=[dfx,dfy]%函数一阶梯度数组形式

g0 = [subs(dfx,[x,y],x0),subs(dfy,[x,y],x0)]%给一阶梯度赋值
p0=-g0 %下降方向
 %step4 精确一维搜索求步长  
         %由于只有两个变量，求步长只需解二次方程，可以直接解得结果
syms ak
m0 = x0+ ak*p0;
f11=subs(f,[x,y],m0)
ak=solve(diff(f11))
x1=x0+ak*p0     %step5
%%
while 1
g1 = [subs(dfx,[x,y],x1),subs(dfy,[x,y],x1)]%给一阶梯度赋值
beta=(g1*g1')/(g0*g0')  %k即为beta FR公式
p1=-g1+beta*p0  %更新梯度
    %调用黄金分割法求步长
 syms ak
m0 = x1+ ak*p1;
f11=subs(f,[x,y],m0)
ak=solve(diff(f11));

    
x2=x1+ak*p1     %step5
k=k+1

tt=subs(df,[x,y],x2);
t=sqrt(tt*tt') %一阶梯度值
if(t<epsion)
    break;
end
x1=x2;g0=g1;p0=p1;

end
