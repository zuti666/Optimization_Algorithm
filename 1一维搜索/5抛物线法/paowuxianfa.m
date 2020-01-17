%�����߷������β�ֵ�������������Ż�����������ѧ�����磩22ҳ�㷨1.4.5��д��
%st_xΪ���ŵ�xֵ��best_fxΪ���ŵĺ���ֵ��yΪ������xΪ����y�ı�����x1,x0,x2Ϊ��֪������������f1>f0
function[best_x, best_fx]=paowuxianfa(y,x,x1,x0,x2,epsilon1,epsilon2)
if nargin==5
    epsilon1=0.0000001;
    epsilon2=0.0000001;
end
%��f(x1),f(x0),f(x2)
f1=subs(y,x,x1);
f0=subs(y,x,x0);
f2=subs(y,x,x2);
k=0
while abs(x1-x2)>epsilon1   &&   abs((x2-x0)*f1+(x1-x2)*f0+(x0-x1)*f2 ) > epsilon2    %step1 step2
    x3=0.5*((x2^2-x0^2)*f1+(x1^2-x2^2)*f0+(x0^2-x1^2)*f2)/((x2-x0)*f1+(x1-x2)*f0+(x0-x1)*f2);%step3   x3��Ӧ�㷨�е�xһ�Σ�����x������һ��������
    f3=subs(y,x,x3);
     %step4
    if f0-f3<0 % תstep6 step��һ�����
        %% step6
        if x0<x3            
            x2=x3;
            f2=f3;
        elseif x0>x3
            x1=x3; f1=f3;
        end
    elseif f0-f3==0  %תstep7
        %% step7
        if x0<x3           
            x1=x0;
            x2=x3;
            x0=0.5*(x1+x2);
            f1=f0;
            f2=f3;
            f0=subs(y,x,x0);
        elseif x0==x3   %תstep8
            %%  step8 
               x4=0.5*(x1+x0); f4=subs(y,x,x4);%x4��Ӧ�㷨�е�xһð������x������һ����^��
               if f4 <f0               
                  x2=x0;
                  x0=x4;
                  f2=f0;
                  f0=f4;
               elseif f4==f0
                  x1=x4;x2=x0;x0=0.5*(x1+x2);
                  f1=f4;f2=f0,f0=subs(y,x,x0);
               elseif f4>f0
                    x1=x4;
                    f1=f4;
               end
        else  %תstep9
             %% step9
            x1=x3;x2=x0;x0=0.5*(x1+x2);
            f1=f3;f2=f0;f0=subs(y,x,x0);        
         end   
    else  
         %% step5
        if x0>x3
            x2=x0;x0=x3;f2=f0;f0=f3;
        elseif x0<x3
            x1=x0;x0=x3;f1=f0;f0=f3;
        end
    end  %if f0-f3<0
    k=k+1
end  %

best_x=x0;
best_fx=f0;
end
