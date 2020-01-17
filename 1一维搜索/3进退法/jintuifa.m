%���˷�������ȷ���µ�������.�������Ż�����������ѧ�����磩20ҳ�㷨1.4.3��д��
%[left right]Ϊ�µ������䣬yΪ������xΪ����y�ı�����x0Ϊ��ʼ�㣨Ĭ��Ϊ0��,step��>0��Ϊ��ʼ������Ĭ��Ϊ0.01��
function [left, right] = jintuifa(y,x,x0,step)
if nargin==3%��ֻ����������ʱ��Ĭ�����ò���Ϊ0.01
    step=0.01;
end
if nargin==2
    x0=0;%��ֻ����������ʱ��Ĭ�����ó�ʼ��Ϊ0
    step=0.01;
end

f0=subs(y,{x},{x0});%step1 ��f(x0) ������y�б���x�滻Ϊx0
x1=x0+step;%step2
f1=subs(y,{x},{x1});

if (f1<=f0)%step3 step4
    step=2*step;
    x2=x1+step;
    f2=subs(y,{x},{x2});
    while(f1>f2)
        x0=x1; x1=x2;
        f0=f1; f1=f2;
        step=2*step;
        x2=x1+step;
        f2=subs(y,{x},{x2});
    end
    left=x0
    right=x2
else%step5 step6
    step=2*step;
    x2=x1-step;
    f2=subs(y,{x},{x2});
    while(f0>f2)
        x1=x0; x0=x2;
        f1=f0; f0=f2;
        step=2*step;
        x2=x1-step;
        f2=subs(y,{x},{x2});
    end
    left=x2;right=x1;
end