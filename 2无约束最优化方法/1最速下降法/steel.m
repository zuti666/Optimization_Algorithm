%最速下降法 最优化方法 解可新 天津大学出版社 p97 
%p
%M文件：
function [R,n]=steel(x0,y0,eps)
% 参数 起始点(x0,y0),误差精度eps
syms x;
syms y;
f=(x)/2+(y^2)*9/2;
v=[x,y];
j=jacobian(f,v);    %求函数的Jacobian矩阵
T=[subs(j(1),x,x0),subs(j(2),y,y0)]; %带入数值Jacobian矩阵
temp=sqrt((T(1))^2+(T(2))^2); %计算Jaccobian矩阵的值G
x1=x0;y1=y0;
n=0;%记录迭代次数
syms kk;
while (temp>eps)  %迭代条件
    
    d=-T;           %step3
    f1=x1+kk*d(1);f2=y1+kk*d(2);
    fT=[subs(j(1),x,f1),subs(j(2),y,f2)];
    fun=sqrt((fT(1))^2+(fT(2))^2);
    
    Mini=Gold(fun,0,1,0.00001); %一维搜索求步长 ，黄金分割法
    
    x0=x1+Mini*d(1);y0=y1+Mini*d(2); %step4
    
    T=[subs(j(1),x,x0),subs(j(2),y,y0)]; %step2
    temp=sqrt((T(1))^2+(T(2))^2);
    x1=x0;y1=y0;
    n=n+1;
end
R=[x0,y0];
