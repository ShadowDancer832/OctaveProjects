function  [Pr, D]  = Compute_BF( Map, dim ,ORIGI)  % This Map is a adjacency matrix
  

Pr=zeros(1, dim); % father node of each node
D=zeros(1,dim); % shortest cost to each node

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

    