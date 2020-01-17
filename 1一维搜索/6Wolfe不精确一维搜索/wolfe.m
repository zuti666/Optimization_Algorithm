%Wolfe����ȷһά�������������Ż�����������ѧ�����磩24ҳ�㷨1.4.6��д��
%alphaΪҪ��Ĳ�����xk1Ϊx(k+1)�ǵó�����һ���㣬xkΪ��ʼ��,pkΪ����mu��sigmaΪ������
%һ��mu���ڣ�0��1/2��,sigma����(mu,1)
function[alpha xk1] =wolfe(xk,pk,mu,sigma)
if nargin<=2
    mu=0.1;%Ĭ������
    sigma=0.5;
end
a=0;b=inf;alpha=1;j=0;%step1 j������ǵ������� Inf��ʾ�����
xk1=xk+alpha*pk;%step2 xk1�����㷨���x(k+1) , fk1����f(k+1), gk1����g(k+1)
fk1=f(xk1);
gk1=g(xk1);
fk=f(xk);
gk=g(xk);

while  fk-fk1<-mu*alpha*gk*pk' %������ʽ1.6
    j=j+1;      %step3
    b=alpha;
    alpha=0.5*(alpha+a);
    xk1=xk+alpha*pk;  %step2
    fk1=f(xk1);
    gk1=g(xk1);
end
while gk1* pk'<sigma*gk*pk'               %������ʽ1.7
    j=j+1;    %step4
    a=alpha;
    alpha=min([2*alpha 0.5*(a+b)]);
    xk1=xk+alpha*pk; %step2
    fk1=f(xk1);
    gk1=g(xk1);
end
xk1=xk+alpha*pk;