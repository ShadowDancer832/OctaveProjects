function  [Pr, D]  = Compute_BF( Map, dim ,ORIGI)  % 传入的Map是邻接矩阵
  

Pr=zeros(1, dim); %存储到当前节点最短的父节点（BF为1维）
D=zeros(1,dim); %存储到当前节点的最短距离（这个值是唯一的，因此仅需要一维数组来存储）

for i = 1:dim  % Init D and Pr
  D(i) = Map(ORIGI, i);
  if (D(i) < inf)
    Pr(i) = ORIGI; % if connect, its priori is ORIGI
  else
    Pr(i) = -1; % else disconnect  
  end
end
  
% Main loop
for i = 2:dim-2
  for j = 1:dim
    for k = 1:dim
      if(D(k) > D(j) + Map(j,k))
        D(k) = D(j) + Map(j,k);
        Pr(k) = j;
      endif
    endfor
  endfor
endfor

flag = true;
for j = 1:dim-1
  for k = 1:dim-1
    if(D(k) > D(j) + Map(j,k))
      flag = false;
      break;
    endif
  endfor
  if(flag == false)
    disp('Bellman-ford error:There is a negative cycle！')
    return;
  endif
endfor

    