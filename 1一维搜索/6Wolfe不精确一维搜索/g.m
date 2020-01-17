%求在点x处的梯度，对应p27页1.9 
%这里的x是向量，代表x1,x2……
function result =g(x)

syms x1 x2;%定义符号变量
f=100*(x2-x1^2)^2+(1-x1)^2;
result_1=diff(f,x1);%函数f对符号变量x1求一阶微分
result_2=diff(f,x2);

result(1)=subs(result_1,[x1 x2],[x(1) x(2)]);%将result_1中的符号变量x1和x2替换为普通变量x(1),x(2)
result(2)=subs(result_2,[x1 x2],[x(1) x(2)]);