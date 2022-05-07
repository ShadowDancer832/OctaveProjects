function  [path, D]  = Compute_AS( Map, dim ,ORIGI, DESTI, time_table)

path=zeros(1,dim); %存储到当前节点最短的父节点
D=zeros(1,dim); %存储到当前节点的最短距离
fb=zeros(1,dim);

%初始化：
fb(ORIGI)=1; %fb存储入组节点，起点入组fb
for i=1:dim %最开始的D，为起点到各邻居的距离
    D(i)=Map(ORIGI,i);
    path(1,i)=ORIGI;
end
path(1,ORIGI)=0;

while(sum(fb)~=dim) %只要fb还没存满全部节点，就继续循环
    min=inf;
    for k=1:dim %找当前节点的邻居节点(非组内的那些)，距离最小的入组
        if (fb(k)~=1)&&D(k)<min
            v=k;
            min=D(k);
        end
    end
    fb(v)=1; %入组
    for k=1:dim %探查刚入组的v的所有邻居，最短那个更新为D
        if (fb(k)~=1)&& (min + Map(v,k) < D(k)&& Map(v,k)~=inf)
            D(k)=min + Map(v,k);
            path(k)=v;
          endif
    endfor
      
    if (v == DESTI)&& (time_table(D(v),v)==path(v)) % 若DESTI入组，且time_table判断这的确是最短路径，early exit
      break;
    endif
endwhile

end