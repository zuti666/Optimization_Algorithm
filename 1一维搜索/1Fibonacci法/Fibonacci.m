%Fibonacci�����������Ż�����������ѧ�����磩16ҳ�㷨1.4.1��д��
% st_xΪ���ŵ�xֵ��best_fxΪ���ŵĺ���ֵ��yΪ������xΪ����y�ı�����a,bΪ�µ�������[a,b],epsilonΪ��ȷ��

function [best_x ,best_fx]=Fibonacci(y,x,a,b,epsilon)

if nargin==4
    epsilon=0.0000001;%����Ĭ�ϵ�epsilon
end

c=(b-a)/epsilon;%step1
n=2;F(1)=1;F(2)=1;

n=n+1;F(n) =F(1)+F(2); %step2

while(F(n)<c)  %step3  ����Fibonacci����
    n=n+1;F(n) =F(n-2)+F(n-1); %step2
end


k=1;             %step4
x1=a+F(n-2)/F(n)*(b-a);
x2=a+F(n-1)/F(n)*(b-a);
f1=subs(y,x,x1);
f2=subs(y,x,x2);

disp("����");
disp(a);disp(b);
disp("xֵ");
disp(x1);disp(x2);
disp("����ֵ");
disp(vpa(f1,3));disp(vpa(f2,3));
 

if(f1<f2)       %step5
b=x2;x2=x1;f2=f1;
x1=a+F(n-k-2)/F(n-k)*(b-a);
f1=subs(y,x,x1);
else
a=x1;x1=x2;f1=f2;
x2=a+F(n-k-1)/F(n-k)*(b-a);
f2=subs(y,x,x2);
end

disp("����");
disp(a);disp(b);
disp("xֵ");
disp(x1);disp(x2);
disp("����ֵ");
disp(vpa(f1,3));disp(vpa(f2,3));
k=k+1;               %step6

while(k <n-3)
    
if(f1<f2)       %step5
b=x2;x2=x1;f2=f1;
x1=a+F(n-k-2)/F(n-k)*(b-a);
f1=subs(y,x,x1);
else
a=x1;x1=x2;f1=f2;
x2=a+F(n-k-1)/F(n-k)*(b-a);
f2=subs(y,x,x2);
end
k=k+1;               %step6

disp("����");
disp(a);disp(b);
disp("xֵ");
disp(x1);disp(x2);
disp("����ֵ");
disp(vpa(f1,3));disp(vpa(f2,3));
end


if(f1<f2)           %step7
    b=x2;x2=x1;f2=f1;
else
    a=x1;
end

x1=x2-0.1*(b-a);f1=subs(y,x,x1); %step8
if(f1<f2)
    best_x=(a+x2)/2;
elseif ( f1==f1)
     best_x=(x1+x2)/2;
else
     best_x = (x1+b)/2;
end

best_fx=subs(y,x,best_x);%���ŵĺ���ֵ
end