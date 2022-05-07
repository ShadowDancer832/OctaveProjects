function  [path, D]  = Compute( Map, dim ,ORIGI)

path=zeros(dim); %存储到当前节点最短的父节点（可能存在多个这样的父节点，因此需要多维数组来存储）
D=zeros(1,dim); %存储到当前节点的最短距离（这个值是唯一的，因此仅需要一维数组来存储）
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
            path(:,k)=0;
            path(1,k)=v;
        elseif (fb(k)~=1)&& (min + Map(v,k) == D(k))&& Map(v,k)~=inf %触发这个if，表明不止1条到当前节点的最短路径
            D(k)=min + Map(v,k);
            
            pink=1;
            while(1)
                if(path(pink,k)==0) %如果当前位置无数据，赋值
                    path(pink,k)=v;
                    break;
                else %如果当前位置已有数据，挪动到下一列，下次循环将在下一列尝试赋值
                    pink=pink+1;
                end
            end
        end
    end
    
end

endfunction



