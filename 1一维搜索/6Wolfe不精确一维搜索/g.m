%���ڵ�x�����ݶȣ���Ӧp27ҳ1.9 
%�����x������������x1,x2����
function result =g(x)

syms x1 x2;%������ű���
f=100*(x2-x1^2)^2+(1-x1)^2;
result_1=diff(f,x1);%����f�Է��ű���x1��һ��΢��
result_2=diff(f,x2);

result(1)=subs(result_1,[x1 x2],[x(1) x(2)]);%��result_1�еķ��ű���x1��x2�滻Ϊ��ͨ����x(1),x(2)
result(2)=subs(result_2,[x1 x2],[x(1) x(2)]);