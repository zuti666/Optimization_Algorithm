%��������Ҫ���������һ��Լ�������µ�͹���ι滮����
function [x,lamk,exitflag,output]=qpact(H,c,Ae,be,Ai,bi,x0)
%���ܣ�����Ч��������һ��Լ�����ι滮����
%min f(x)=0.5*x'*H*x+c'*x,
%  s.t.  a'_i*x-b_i=0,(i=1,��,l),
%        a'_i*x-b_i>=0,(i=l+1,��,m)
%���룺x0�ǳ�ʼ�㣬H,c�ֱ���Ŀ�꺯�����ξ����������
%Ae=��a_1,...,a_l��',be=(b_1,...,b_l);
%Ai=(a_{l+1},...,a_m),bi=(b_{l+1},...,b_m)'.
%�����x�����Ž⣬lambda�Ƕ�Ӧ�ĳ���������output�ǽṹ����
%     �����Сֵf(x),��������k����Ϣ��exitflag���㷨��ֹ����
%��ʼ��
epsilon=1.0e-9;err=1.0e-6;
k=0;x=x0;n=length(x);kmax=1.0e3;
ne=length(be);ni=length(bi);lamk=zeros(ne+ni,1);
index=ones(ni,1);
for i=1:ni
    if ~(Ai(i,:)*x==bi(i))
        index(i)=0;
    end
end
%�㷨������
while k<=kmax
    %���������
    Aee=[];
    if ne>0
        Aee=Ae;
    end
    for j=1:ni
        if index(j)>0
            Aee=[Aee;Ai(j,:)];
        end
    end
    disp("���Է������Լ��������")
    disp(Aee);
    gk=H*x+c 
    [m1,n1]=size(Aee);
    [dk,lamk]=qsubp(H,gk,Aee,zeros(m1,1));
    disp("������Է�������lamd��d");
    disp(lamk);
    disp("dk");
    disp(dk);
    if norm(dk)<=err
        y=0.0;
        if length(lamk)>ne
            [y,jk]=min(lamk(ne+1:length(lamk)));
        end
        if y>=0
            exitflag=0;
        else
            exitflag=1;
            for i=1:ni
                if index(i)&&(ne+sum(index(1:i)))==jk
                    index(i)=0;
                    break;
                end
            end
        end
        k=k+1;
    else
        exitflag=1;
        %�󲽳�
        alpha=1.0;tm=1.0;
        for i=1:ni
            if (index(i)==0)&&(Ai(i,:)*dk<0)
                tm1=(bi(i)-Ai(i,:)*x)/(Ai(i,:)*dk);
                if tm1<tm
                    tm=tm1;
                    ti=i;
                end
            end
        end
        alpha=min(alpha,tm);
        disp("����alpha");
        disp(alpha);
        disp("������x")
        x=x+alpha*dk;
        disp(x);
        disp("dk");
        disp(dk);
        disp("x");
        disp(x);
        %������Ч��
        if tm<1
            index(ti)=1;
        end
    end
    if exitflag==0
        break;
    end
    k=k+1;
    disp("k");
    disp(k);
end
output.fval=0.5*x'*H*x+c'*x;
output.iter=k;
