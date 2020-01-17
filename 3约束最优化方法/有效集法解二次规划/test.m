clc;
clear;
H=[2 0;0 2];
c=[-2 -4]';
Ae=[];be=[];
Ai=[1 0;0 1;-1 -1];
bi=[0 0 -1]';
x0=[2 0]';
[x,lambda,exitflag,output]=qpact(H,c,Ae,be,Ai,bi,x0);
x