%牛顿法 最优化方法 天津大学出版社 p101 算法3.3.1
%题目例3.3.2 (x1-2)^4+(x1-2)^2*x2^2+(x2+1)^2
%M文件：
syms  x1 x2; 
f=(x1-2)^4+(x1-2)^2*x2^2+(x2+1)^2;
v=[x1,x2]; 
df=jacobian(f,v); 
df=df.'; 
G=jacobian(df,v); 
epson=1e-12;
x0=[1,1]';
g1=subs(df,{x1,x2},{x0(1,1),x0(2,1)});  %step2
k=0;
while(norm(g1)>epson) %step3
    G1=subs(G,{x1,x2},{x0(1,1),x0(2,1)});  
    p=-G1\g1; 
    x0=x0+p;  %step4
    k=k+1; 
    g1=subs(df,{x1,x2},{x0(1,1),x0(2,1)}); %step2
end
k 
disp(vpa(x0))

