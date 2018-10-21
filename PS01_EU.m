function eu = PS01_EU(z)
global Y R beta Y0 T N t0

zeta=z;
Lzeta=[0; zeta(1:end-1)];

utilities=zeros(size(Y,2), size(R,2)); % create two big matrix
for i=1:1:size(Y,2)
    for j=1:1:size(R,2)
        y=Y(:,i); % vector
        r=R(:,j); % vector
                
        u=-log(y+Lzeta.*r-zeta); % consumption of each time period
        betas=beta*ones(1,T); % beta * vecotor of 1, so this is the vector of betas
%        disp(betas);
        betas=betas.^[1:1:T];  % multiply by elements vector of betas ot vector of [1 2 3 4 5 ...]
        discounted=betas * u;
        utilities(i,j)=discounted;  
    end  
end

%disp(utilities);

for i=1:1:N
    uTmp = mean(utilities(i,:));
    for j=1:1:N
        eu = mean(uTmp);
    end
end

eu = mean(uTmp);

end

