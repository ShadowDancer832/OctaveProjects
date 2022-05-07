a = [
    [216, 78, 78, 0, 0, 0];
    [216, 464, 464, 0, 0, 0] ;
    [78, 98, 78, 98, 0, 0];
    [99, 25, 0 0 0 0];
    [99, 25, 44 1 56 12];
    [33, 0, 5 ,3, 0, 8];
    ];

branch = [];
branch_tmp = [];
last_len = 0;
first_flag = 1;
for i = transpose(a)
    branch_tmp = [];
    tmp = unique(i);
    for k = transpose(tmp(1:length(tmp)))
        if(k~=0)
            branch_tmp = [branch_tmp, k];
        end
    end
    if first_flag
        last_len = length(branch_tmp);
    end
    
    if last_len >= length(branch_tmp)
        branch = [branch; [branch_tmp, zeros(last_len - length(branch_tmp))]];
        if first_flag
            first_flag = 0;
        end
    else
        if first_flag
            branch = branch_tmp;
            first_flag = 0;
        else
            branch = [branch, zeros(size(branch,1), length(branch_tmp) - last_len)];
            branch = [branch; branch_tmp];
        end
    end
    last_len = size(branch,2);
end

disp(a)
disp(branch)