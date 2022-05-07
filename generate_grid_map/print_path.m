function [ V ] = print_path( ORIGI, ik, cur, V , path )

%为了递归使用，cur已在外部定义为空，而后传递进来
%ik最开始是DESTI
%V记录所有最短路径，一维，以0作为分隔符
cur=[ik cur];
if ik==ORIGI %终止条件
%     disp(cur);
    V=[V 0 cur];
    return;
end

for i=1:length(path(:,ik))
    if path(i,ik)~=0
        V=print_path( ORIGI, path(i,ik) , cur, V , path );
    end
end

end

