%抛物线法（二次插值法）。根据最优化方法（天津大学出版社）22页算法1.4.5编写。
%st_x为最优的x值，best_fx为最优的函数值，y为函数，x为函数y的变量，x1,x0,x2为已知的三点且满足f1>f0
function[best_x, best_fx]=paowuxianfa(y,x,x1,x0,x2,epsilon1,epsilon2)
if nargin==5
    epsilon1=0.0000001;
    epsilon2=0.0000001;
end
%求f(x1),f(x0),f(x2)
f1=subs(y,x,x1);
f0=subs(y,x,x0);
f2=subs(y,x,x2);
k=0
while abs(x1-x2)>epsilon1   &&   abs((x2-x0)*f1+(x1-x2)*f0+(x0-x1)*f2 ) > epsilon2    %step1 step2
    x3=0.5*((x2^2-x0^2)*f1+(x1^2-x2^2)*f0+(x0^2-x1^2)*f2)/((x2-x0)*f1+(x1-x2)*f0+(x0-x1)*f2);%step3   x3对应算法中的x一拔，就是x上面有一个“—”
    f3=subs(y,x,x3);
     %step4
    if f0-f3<0 % 转step6 step第一种情况
        %% step6
        if x0<x3            
            x2=x3;
            f2=f3;
        elseif x0>x3
            x1=x3; f1=f3;
        end
    elseif f0-f3==0  %转step7
        %% step7
        if x0<x3           
            x1=x0;
            x2=x3;
            x0=0.5*(x1+x2);
            f1=f0;
            f2=f3;
            f0=subs(y,x,x0);
        elseif x0==x3   %转step8
            %%  step8 
               x4=0.5*(x1+x0); f4=subs(y,x,x4);%x4对应算法中的x一冒，就是x上面有一个“^”
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
        else  %转step9
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
