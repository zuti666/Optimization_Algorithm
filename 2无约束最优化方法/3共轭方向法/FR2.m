%�����Ż� p111 �㷨3.4.2����FR�����ݶȷ�  ʹ�þ�ȷһά��������Ϊ����κ��� 
%%
clc; clear 
syms x y t ;
x0=[2,2];%��ʼֵ
k=1;%��¼��������
epsion = 0.00001; %��ȷ�ȿ���
f=x.^2+y.^2-x*y+2*x-4*y;;%��������3.4.1 3/2*x1^2+1/2*y^2-x*y-2*x
%%
dfx=diff(f,x);  % step2
dfy=diff(f,y);
df=[dfx,dfy]%����һ���ݶ�������ʽ

g0 = [subs(dfx,[x,y],x0),subs(dfy,[x,y],x0)]%��һ���ݶȸ�ֵ
p0=-g0 %�½�����
 %step4 ��ȷһά�����󲽳�  
         %����ֻ�������������󲽳�ֻ�����η��̣�����ֱ�ӽ�ý��
syms ak
m0 = x0+ ak*p0;
f11=subs(f,[x,y],m0)
ak=solve(diff(f11))
x1=x0+ak*p0     %step5
%%
while 1
g1 = [subs(dfx,[x,y],x1),subs(dfy,[x,y],x1)]%��һ���ݶȸ�ֵ
beta=(g1*g1')/(g0*g0')  %k��Ϊbeta FR��ʽ
p1=-g1+beta*p0  %�����ݶ�
    %���ûƽ�ָ�󲽳�
 syms ak
m0 = x1+ ak*p1;
f11=subs(f,[x,y],m0)
ak=solve(diff(f11));

    
x2=x1+ak*p1     %step5
k=k+1

tt=subs(df,[x,y],x2);
t=sqrt(tt*tt') %һ���ݶ�ֵ
if(t<epsion)
    break;
end
x1=x2;g0=g1;p0=p1;

end
