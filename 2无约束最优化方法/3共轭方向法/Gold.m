%调用黄金分割法：
%M文件：
function Mini=Gold(f,a0,b0,eps)
syms x;format long;
u=a0+0.382*(b0-a0);
v=a0+0.618*(b0-a0);
syms ak
k=0;
a=a0;b=b0;
array(k+1,1)=a;array(k+1,2)=b;
while((b-a)/(b0-a0)>=eps)
    Fu=subs(f,ak,u);
    Fv=subs(f,ak,v);
    if(Fu<=Fv)
        b=v;
        v=u;
        u=a+0.382*(b-a);
        k=k+1;
    elseif(Fu>Fv)
        a=u;
        u=v;
        v=a+0.618*(b-a);
        k=k+1;
    end
    array(k+1,1)=a;array(k+1,2)=b;
end
Mini=(a+b)/2;
