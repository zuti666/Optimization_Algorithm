function [best_x,best_fx,count]=    BFGS(x0,ess)
syms x1 x2 t;
f=x1*x1+2*x2*x2-2*x1*x2-4*x1;
fx=diff(f,x1);%����ʽf��x1��һ���� 
fy=diff(f,x2);%����ʽf��x2��һ����
fi=[fx fy];%���캯��f���ݶȺ���
%��ʼ����ݶȺͺ���ֵ
g0=subs(fi,[x1 x2],x0);
f0=subs(f,[x1 x2],x0);
H0=eye(2);
%���x0,f0,g0
x0
f0
g0
xk=x0;
fk=f0;
gk=g0;
Hk=H0;
k=1;
while(norm(gk)>ess)%������ֹ����||gk||<=ess
 disp('************************************************************') 
   disp(['��' num2str(k) '��Ѱ��'])
    %ȷ����������
   pk=-Hk*gk';
   %�ɲ����ҵ���һ��x(k+1)
   xk=xk+t*pk';
   f_t=subs(f,[x1 x2],xk); %����һԪ������һԪ������(t)
   %��һά�����ҵ����Ų���
   df_t=diff(f_t,t);
   tk=solve(df_t);
   if tk~=0
       tk=double(tk);
   else
       break;
   end
   %������һ��ĺ���ֵ���ݶ�
   xk=subs(xk,t,tk)
   fk=subs(f,[x1 x2],xk)
   gk0=gk;
   gk=subs(fi,[x1 x2],xk)
   %DPFУ����ʽ���ҵ���������
   yk=gk-gk0;
   sk=tk*pk';
   wk=(yk*Hk*yk')^(1/2)*(sk'/(yk*sk')-Hk*yk'/(yk*Hk*yk'));
   Hk=Hk-(Hk*yk'*yk*Hk)/(yk*Hk*yk')+sk'*sk/(yk*sk')+wk*wk';      %������ʽ
   k=k+1;
end
disp('������£�') 
best_x=xk;%���ŵ�
best_fx=fk;%����ֵ
count=k-1;
