close all, clear all, clc;
%A simple bandit algorithm.

mean = [0.1, -0.8, 1.3, 0.3, 1.1];
Q = zeros(size(mean));
N = zeros(size(mean));
e = 0.01;
value(1) = 0;
Choice = zeros(1,20000);
for i = 2:20000
    if rand(1) < 1-e
        [~, A] = max(Q);
    else
        A = randi(5,1);
    end
    reward = randn(size(mean))+mean;
    [~,I] = max(reward);
    if I == A
        Choice(i) = Choice(i-1)+1;
    end
    R = reward(A);
    N(A) = N(A)+1;
    Q(A) = Q(A)+(R-Q(A))/N(A);
end
t = 1:20000;
figure()
plot(Choice);
disp('Done');
