means=250; sampsize=30;
for i=1:means
    samp=N(ceil(length(N)*rand(sampsize,1)));
    meani(i)=mean(samp);
end

hist(meani)
skewness(meani)
