function m=OrderMap(Map, dim)

mm=zeros(dim);
for i=1:dim
    for j=1:dim
        if(i~=j)
            mm(i,j)=inf;
        end
    end
end %将对角线之外都赋值为∞，即暂定所有节点互不可达，对角线为0表示节点到本身可达距离为0
for i=1:length(Map)
    mm(Map(i,1),Map(i,2))=Map(i,3);
end %将 n*3 矩阵转换为 n*n 方阵，横坐标表示向量起点，纵坐标表示向量终点，值表示向量模
    %若该向量无向，则mm(i:j)=mm(j:i)；否则mm(i:j)或mm(j:i)中将有一个值为∞，表示有一方向不可达
m=mm;