clear;

N=[10:10:300];
%N=30;
timeRA=zeros(length(N),50);
timeDJ=zeros(length(N),50);
timeBF=zeros(length(N),50);
timeAS=zeros(length(N),50);
avgPaths=zeros(length(N),1);
num_map = 50

for iiSTA=N % 30个横坐标
    sumPaths=0; %用于统计path数目
    for iSTA=1:num_map %每种节点规模跑50张不同图
        nameMap=['newMaps2/Map' num2str(iiSTA) 'B' num2str(iSTA) '.mat'];
        load(nameMap); % Map
        dim=iiSTA; %节点个数
        sumPaths=sumPaths+length(Map);
        
        ORIGI=unidrnd(dim); %路径起点
        DESTI=unidrnd(dim); %路径终点
        while DESTI==ORIGI
            DESTI=unidrnd(dim); %若终点等于起点，重新随机一次
        end

        
        disp('************atimeRA*************************');
        disp(nameMap);
        disp(['dim=' num2str(dim) ',' num2str(ORIGI) '--' num2str(DESTI)]);
        
        
        tic
        [ pathNode, pathTime ]=resonanceAlg(Map, ORIGI, DESTI);
        tRA=toc;
        
        tic
        [Optimal, D]=DijkstraArithmetic(Map, dim, ORIGI, DESTI );
        tDJ=toc;
        
        tic
        [Optimal_BF, D_BF]=BF_Arithmetic(Map, dim, ORIGI, DESTI );
        tBF=toc;
        
        [Optimal_AS, D_AS, tAS]=AS_Arithmetic(Map, dim, ORIGI, DESTI );

        %% 显示 %%%%
        disp(['Resonance:' num2str(tRA)]);
        DispPaths(pathNode, pathTime);
        disp(['Dijkstra:' num2str(tDJ)]);
        Display(Optimal, D);
        disp('-----------------');
        disp(['Bellman-ford:' num2str(tBF)]);
        Display(Optimal_BF, D_BF);
        disp('-----------------');
        disp(['A-star:' num2str(tAS)]);
        Display(Optimal_AS, D_AS);
        
        %% 暂时存储在两个矩阵中 %%%%
        timeRA(find(N==iiSTA),iSTA)=tRA;
        timeDJ(find(N==iiSTA),iSTA)=tDJ;
        timeBF(find(N==iiSTA),iSTA)=tBF;
        timeAS(find(N==iiSTA),iSTA)=tAS;
    end
    avgPaths(find(N==iiSTA),1)=round(sumPaths/num_map); %计算平均path数
end

%% 最终存储 %%
save('data/btimeRA.mat' , 'timeRA', '-v7');
save('data/btimeDJ.mat', 'timeDJ', '-v7');
save('data/btimeBF.mat', 'timeBF', '-v7');
save('data/btimeAS.mat', 'timeAS', '-v7');
save('data/bavgPaths.mat', 'avgPaths', '-v7');