function eu = PS01_EU(z)
global Y R beta T N

zeta=z;
Lzeta=[0; zeta(1:end-1)];

utilities=zeros(size(Y,2), size(R,2)); % create a big matrix N x N
for i=1:1:size(Y,2)
    for j=1:1:size(R,2)
        y=Y(:,i); % vector y is a column i from matrix Y
        r=R(:,j); % vector r is a column j from matrix R
                
        u=-log(y+Lzeta.*r-zeta); % consumption of each time period, * -1 because we need maximaze our function, but we have just a fmincon which can minimize function
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

