%�����Ż� p111 �㷨3.4.2���� FR�����ݶȷ���һά����Ϊ�ƽ�ָ
%%
clc; clear 
syms x y t ;
x0=[0,0];%��ʼֵ
k=1;%��¼��������
epsion = 0.0001; %��ȷ�ȿ���
f=(3/2)*x.^2+(y.^2)/2-x*y-2*x;%��������3.4.1 3/2*x1^2+1/2*y^2-x*y-2*x
%%
dfx=diff(f,x);  % step2
dfy=diff(f,y);
df=[dfx,dfy];%����һ���ݶ�������ʽ

g0 = [subs(dfx,[x,y],x0),subs(dfy,[x,y],x0)];%��һ���ݶȸ�ֵ
p0=-g0; %�½�����

 %���ûƽ�ָ�󲽳�
syms ak
pk=x0+ak*p0;
f1=subs(f,[x,y],[pk(1),pk(2)]) ;               
ak=Gold(f1,0,10,epsion);  %������[0,10],�ڸ����ľ�ȷ�������Ž�
 
x1=x0+ak*p0;     %step5
%%
while 1
g1 = [subs(dfx,[x,y],x1),subs(dfy,[x,y],x1)];%��һ���ݶȸ�ֵ
beta=g1*(g1'-g0')/(g0*g0');%k��Ϊbeta  PRP

p1=-g1+beta*p0;%�����ݶ�
    %���ûƽ�ָ�󲽳�
 syms ak
 pk=x1+ak*p1;
 f1=subs(f,[x,y],[pk(1),pk(2)]) ;               
 ak=Gold(f1,0,10,epsion);  %������[0,10],�ڸ����ľ�ȷ�������Ž�
    
x2=x1+ak*p1;     %step5
k=k+1

tt=subs(df,[x,y],x2);
t=sqrt(tt*tt');%һ���ݶ�ֵ
if(t<epsion)
    break;
end
x1=x2;g0=g1;p0=p1;

end
