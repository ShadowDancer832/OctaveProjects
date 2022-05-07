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
first_flag = 1;
zeros_size = 0;
for i = transpose(a)
    branch_tmp = [];
    tmp = unique(i);
    for k = transpose(tmp(1:length(tmp)))
        if(k~=0)
            branch_tmp = [branch_tmp, k];
        end
    end
    
    if first_flag
      zeros_size = 0;
      branch = branch_tmp;
      first_flag = 0;
      continue;
    else
      zeros_size = abs(size(branch, 2) - length(branch_tmp));
    end
  
    if size(branch, 2) >= length(branch_tmp) 
        branch = [branch; [branch_tmp, zeros(1, zeros_size)]];
        if first_flag
            first_flag = 0;
        end
    else
        if first_flag
        else
            branch = [branch, zeros(size(branch,1), zeros_size)];
            branch = [branch; branch_tmp];
        end
    end
%    disp(branch)
end

disp(a);
disp("===============================================");
disp(branch);