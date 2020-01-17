clc
%test
x0=[2 0];
ess=1e-6;
[best_x,best_fx,count]=DFP(x0,ess)
disp("------------------")
%[best_x,best_fx,count]=BFGS(x0,ess)
%disp("------------------")
%[best_x,best_fx,count]=R1(x0,ess)
