function [ y ] = GDMin(A,b,x,e,MAX)

% 正定二次型函数的最速梯度下降法求解正定二次函数极小点
% A  表示主系数矩阵
% b  表示副系数矩阵
% x  表示起始点
% e 表示精度控制
% MAX 表示迭代次数控制

if nargin < 5
    MAX = 50;%设置默认最大迭代次数
end
if A ~= A'
    error('input matrix is not symmetrical ');%检查A是否为对称阵
end


%开始循环迭代
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
        step = -(x'*A+b')*direction/(direction'*A*direction); %步长 
        fprintf('step(%d)=: ', k);
        disp(step);
        disp('------------------------------');
        x = x+step*direction;  %迭代公式
    end
end
end