%Wolfe不精确一维搜索。根据最优化方法（天津大学出版社）24页算法1.4.6编写。
%alpha为要求的步长，xk1为x(k+1)是得出的下一个点，xk为初始点,pk为方向，mu和sigma为参数，
%一般mu属于（0，1/2）,sigma属于(mu,1)
function[alpha xk1] =wolfe(xk,pk,mu,sigma)
if nargin<=2
    mu=0.1;%默认设置
    sigma=0.5;
end
a=0;b=inf;alpha=1;j=0;%step1 j用来标记迭代次数 Inf表示无穷大
xk1=xk+alpha*pk;%step2 xk1代表算法里的x(k+1) , fk1代表f(k+1), gk1代表g(k+1)
fk1=f(xk1);
gk1=g(xk1);
fk=f(xk);
gk=g(xk);

while  fk-fk1<-mu*alpha*gk*pk' %不满足式1.6
    j=j+1;      %step3
    b=alpha;
    alpha=0.5*(alpha+a);
    xk1=xk+alpha*pk;  %step2
    fk1=f(xk1);
    gk1=g(xk1);
end
while gk1* pk'<sigma*gk*pk'               %不满足式1.7
    j=j+1;    %step4
    a=alpha;
    alpha=min([2*alpha 0.5*(a+b)]);
    xk1=xk+alpha*pk; %step2
    fk1=f(xk1);
    gk1=g(xk1);
end
xk1=xk+alpha*pk;