clear all
clc

global Y R T N beta Y0 

% max \sum E(\beta^i log(E(Y0+z_{t-1}*R-z_t)))

%Solves the problem at time 0 for T=10

T=10;
N=9;
beta=0.9;
phi_0=1;
phi_1=0.9;
Y0 = 10;
e_mean = 0;
e_sigma = 0.3;
rH = 0.01;
rL = 0.05;

for j=1:1:N
    Y(1,j)=Y0; 
end

for i=2:1:T
    for j=1:1:N
        Y(i,j)=max((phi_0+phi_1*Y(i-1,j)+normrnd(e_mean, e_sigma)),0); % X - matrix[T:N]
%        fprintf('%s','i: '); fprintf('%d\n',Y(i,j));

    end
end    
%disp(Y);

R=rL + round(rand(T,N)) * (rH - rL); % X - matrix[T:N]
%disp(R);

plot(Y);
%plot(R);

options = optimoptions('fmincon','Display','notify');
[zeta, fval]=fmincon(@PS01_EU, ones(T,1)+0.1, [], [], [], [], [], [], [], options);

disp(zeta);
disp(-1*fval);


%%
%Compare the 2 dimensional with the solution iterating
%eu=@(z) -(W-z*P(1,1))^2+beta*mean(-(W+z*Y(2,:)).^2);
%zetas=[-1:0.01:1]';
%eus=zeros(size(zetas,1),1);
%for i=1:1:size(zetas,1)
%    eus(i)=eu(zetas(i));   
%end
%figure
%plot(zetas, eus);
%hold all
%plot(zeta, -fval, 'x')
%hold all
%[maximum, index]=max(eus);
%max_z=zetas(index);
%plot(max_z, maximum, 'o')
%hold off
