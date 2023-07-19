%all three treatmeant groups
a= [13.5 6.9 4.2 9.6 -7.6 5.5 3.2 -3.6 0.1 3.3];
b= [-0.7 16.8 7.6 4.4 7.6 3.9 4.2 10.7 10.3 10.4 7.4];
c= [0.1 9 13.2 7.9 10.5 9 4.3 7.1];

%means
x1_bar = mean(a);
x2_bar = mean(b);
x3_bar = mean(c);

%standard deviations
s1 = std(a);
s2 = std(b);
s3 = std(c);

%calculating p value for df1=2, df2=26, and F=2.11
p = 1-fcdf(2.11, 2, 26);

%reproducing the p value using anova1 function
y = [a,b,c];
group = repelem(1:3, 1, [numel(a),numel(b),numel(c)]);

prob = anova1(y, group);

