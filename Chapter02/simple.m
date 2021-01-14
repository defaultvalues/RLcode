close all, clear all, clc;
%A simple bandit algorithm.

mean = [0.1, -0.8, 1.3, 0.3, 1.1];
Q = zeros(size(mean));
N = zeros(size(mean));
e = 0.01;
value(1) = 0;

for i = 1:200
    if rand(1) < 1-e
        [~, A] = max(Q);
    else
        A = randi(5,1);
    end
    reward = randn(size(mean))+mean;
    R = reward(A);
    N(A) = N(A)+1;
    Q(A) = Q(A)+(R-Q(A))/N(A);
    value(i+1) = value(i)+R;
end

figure()
plot(value)