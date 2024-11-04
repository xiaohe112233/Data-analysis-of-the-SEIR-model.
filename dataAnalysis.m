传统的SEIR模型
%--------------------------------------------------------------------------
%   初始化
%--------------------------------------------------------------------------
clear;clc;

%--------------------------------------------------------------------------
%   参数设置
%--------------------------------------------------------------------------
N = 189000;%人口总数
E = 0; %潜伏者
I = 1; %传染者
S = N - I;%易感者
R = 0; %康复者
r = 15;%感染者接触易感者的人数
B = 0.0566;%传染概率
a = 0.14;%潜伏者转化为感染者概率
y = 0.31;%康复概率
T = 1:140;
for idx = 1:length(T)-1
    S(idx+1) = S(idx) - r*B*S(idx)*I(idx)/N;
    E(idx+1) = E(idx) + r*B*S(idx)*I(idx)/N-a*E(idx);
    I(idx+1) = I(idx) + a*E(idx) - y*I(idx);
    R(idx+1) = R(idx) + y*I(idx);
end
plot(T,E,T,I,T,R);grid on;
xlabel('天');ylabel('人数')
legend('潜伏者','传染者','康复者')