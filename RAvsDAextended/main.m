clear;

N=[10:10:300];
%N=10;
timeRA=zeros(length(N),50);
timeDJ=zeros(length(N),50);
avgPaths=zeros(length(N),1);

for iiSTA=N % 30个横坐标
    sumPaths=0; %用于统计path数目
    for iSTA=1:50 %每种节点规模跑50张不同图
        nameMap=['newMaps2/Map' num2str(iiSTA) 'B' num2str(iSTA) '.mat'];
        load(nameMap); % Map
        dim=iiSTA; %节点个数
        sumPaths=sumPaths+length(Map);
        
        ORIGI=unidrnd(dim); %路径起点
        DESTI=unidrnd(dim); %路径终点
        while DESTI==ORIGI
            DESTI=unidrnd(dim); %若终点等于起点，重新随机一次
        end
        % ORIGI=1; %路径起点
        % DESTI=5; %路径终点
        
        disp('*************************************');
        disp(nameMap);
        disp(['dim=' num2str(dim) ',' num2str(ORIGI) '--' num2str(DESTI)]);
        
        %% 探查器开始计时%%%%%
%         profile on
        
        tic
        [ pathNode, pathTime ]=resonanceAlg(Map, ORIGI, DESTI);
        tRA=toc;
        
        tic
        [Optimal, D]=DijkstraArithmetic(Map, dim, ORIGI, DESTI );
        tDJ=toc;
        
%         profile viewer %探查器结束计时

        %% 显示 %%%%
        disp(['Resonance:' num2str(tRA)]);
        DispPaths(pathNode, pathTime);
        disp(['Dijkstra:' num2str(tDJ)]);
        Display(Optimal, D);
        
        %% 暂时存储在两个矩阵中 %%%%
        timeRA(find(N==iiSTA),iSTA)=tRA;
        timeDJ(find(N==iiSTA),iSTA)=tDJ;
    end
    avgPaths(find(N==iiSTA),1)=round(sumPaths/20); %计算平均节点数
end

%% 最终存储 %%
save('atimeRA.mat' , 'timeRA');
save('atimeDJ.mat' ,'timeDJ');
save('avgPaths.mat' , 'avgPaths')