function  [Pr, D]  = Compute_AS( Map, dim ,ORIGI, DESTI, H)

disp(['dim:'  num2str(dim)])
Pr=zeros(1, dim); %存储到当前节点最短的父节点
F=zeros(1,dim); 
D=zeros(1,dim); %存储到当前节点的最短距离（这个值是唯一的，因此仅需要一维数组来存储）
fb=zeros(1,dim);

%初始化：
fb(ORIGI)=1; %fb存储入组节点，起点入组fb
for i=1:dim %最开始的D，为起点到各邻居的距离
    F(i)=Map(ORIGI,i) + H(i);
    D(i)=Map(ORIGI,i);
    Pr(1,i)=ORIGI;
endfor
Pr(ORIGI)=0;

while(sum(fb)~=dim) %只要fb还没存满全部节点，就继续循环
    min=inf;
    for k=1:dim %找当前节点的邻居节点(非组内的那些)，距离最小的入组
        if (fb(k)~=1)&&F(k) + H(k)<min
            v=k;  % v points to current node
            min=F(k) + H(k);
            minF = D(k);
        endif
    endfor
    fb(v)=1; %入组

    for k=1:dim %探查刚入组的v的所有邻居，更新最短的邻居的D
        if (fb(k)~=1)&& (min + Map(v,k) + H(k) < F(k)+H(k)&& Map(v,k)~=inf)
            F(k)=min + Map(v,k) + H(k);
            D(k)=minF + Map(v,k);
            Pr(k)=v;
        endif
    endfor

  if v == DESTI % 若DESTI入组，判断early exit
    break;
  endif
endwhile

endfunction
