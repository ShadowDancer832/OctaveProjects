branch = [
    [216, 78, 78, 0, 0, 0];
    [216, 464, 464, 0, 0, 0] ;
    [78, 98, 78, 98, 0, 0];
    [99, 25, 0 0 0 0];
    [99, 25, 44 1 56 12];
    [33, 0, 5 ,3, 0, 8];
    ];

[m,n]=size(branch);  % [rows, cols]
branch_end=cell(1,m);  % m rows
for q=1:m
    branch_end(1,q)={unique(branch(q,:))};
end
% cut off zero
for qq=1:m
    temp=cell2mat(branch_end(1,qq));
    temp(find(temp==0))=[];
    branch_end(1,qq)={temp};
end
branch_length=cellfun('length',branch_end);
r = length(branch_length);
c = max(branch_length);
branch_new = zeros(r, c);
for qqq=1:r
  branch_new(qqq, 1:length(cell2mat(branch_end(1, qqq)))) = cell2mat(branch_end(1, qqq));
end

disp(branch);
disp(branch_end);
disp(branch_new)