function [ y ] = GDMin(A,b,x,e,MAX)

% ���������ͺ����������ݶ��½�������������κ�����С��
% A  ��ʾ��ϵ������
% b  ��ʾ��ϵ������
% x  ��ʾ��ʼ��
% e ��ʾ���ȿ���
% MAX ��ʾ������������

if nargin < 5
    MAX = 50;%����Ĭ������������
end
if A ~= A'
    error('input matrix is not symmetrical ');%���A�Ƿ�Ϊ�Գ���
end


%��ʼѭ������
for k=1:1:MAX
    direction = -(A*x+b);
    disp('------------------------------');
    fprintf('d[%d]=:',k);
    disp(direction');
    if normest(direction) <= e
        y = x;
        break;
    else
        fprintf('X[%d]=:',k);
        disp(x');
        step = -(x'*A+b')*direction/(direction'*A*direction); %���� 
        fprintf('step(%d)=: ', k);
        disp(step);
        disp('------------------------------');
        x = x+step*direction;  %������ʽ
    end
end
end