%ƽ�ַ����������Ż�����������ѧ�����磩21ҳ�㷨1.4.4��д��
% st_xΪ���ŵ�xֵ��best_fxΪ���ŵĺ���ֵ��yΪ������xΪ����y�ı�����a,bΪ�µ�������[a,b],epsilonΪ��ȷ��
%�����������䳤��|b-a|<=epsilonʱֹͣ����
function [best_x ,best_fx]=ErFen(y,x,a,b,epsilon)

if nargin==4
    epsilon=0.0000001;%����Ĭ�ϵ�epsilon
end

if a>b    %��֤a<b
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



best_x=c;%���ŵ�xֵ
best_fx=subs(y,x,c);%���ŵĺ���ֵ
end