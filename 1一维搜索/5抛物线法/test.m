%���������߷�
syms x;
y = x.^4+2.*x+4; %p26 1.7
[best_x, best_fx]=paowuxianfa(y,x,-1/2,-1,0,0.01,0.01); %ʹ�������߷���� yΪ������xΪ����y�ı�����x1,x0,x2Ϊ��֪������������f1>f0,����Ϊ0.0000001
disp(vpa(best_x,3));
disp(vpa(best_fx,3));