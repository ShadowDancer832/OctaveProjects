function Display(Optimal,d)

s=[num2str(Optimal(2)) '(' num2str(0) ')-->'];
for i=3:length(Optimal)
    if Optimal(i)~=0
        s=[s num2str(Optimal(i)) '(' num2str(d(Optimal(i))) ')-->'];
    elseif Optimal(i)==0
        s=s(1:end-3); %去掉多余的-->
        s=[s char(13,10)']; % char(13,10)'  是换行符号，可实现一串字符串最后输出的时候有换行效果
    end
end
s=s(1:end-3); %去掉最后一个多余的-->
s=strtrim(s);
disp(s);