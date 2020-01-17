%�ƽ�ָ���������Ż�����������ѧ�����磩17ҳ�㷨1.4.2��д��
% st_xΪ���ŵ�xֵ��best_fxΪ���ŵĺ���ֵ��yΪ������xΪ����y�ı�����a,bΪ�µ�������[a,b],epsilonΪ��ȷ��
%�����������䳤��|b-a|<=epsilonʱֹͣ����
function [best_x ,best_fx]=golddiv(y,x,a,b,epsilon)

if nargin==4
    epsilon=0.0000001;%����Ĭ�ϵ�epsilon
end

k=1;%��¼��������

x2=a+0.618*(b-a);%step1
f2=subs(y,x,x2);

x1=a+0.382*(b-a);%step2
f1=subs(y,x,x1);

while(abs(b-a)>epsilon)
    if f1<f2
        b=x2;x2=x1;f2=f1;
        x1=a+0.382*(b-a); %תstep2
        f1=subs(y,x,x1);
    elseif f1==f2
        a=x1;b=x2;
        x2=a+0.618*(b-a);f2=subs(y,x,x2);%תstep1
        x1=a+0.382*(b-a);f1=subs(y,x,x1);
    else
        a=x1;x1=x2;f1=f2;
        x2=a+0.618*(b-a);%step5
        f2=subs(y,x,x2);
    end
    
    k=k+1; 
    disp("��������");
    disp(k);
    disp("����");
    disp(a);disp(b);
    
end%while
best_x=(a+b)/2;%���ŵ�xֵ
best_fx=subs(y,x,best_x);%���ŵĺ���ֵ
end