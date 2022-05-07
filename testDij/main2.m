clear;

N=[10:10:300];
%N=30;
timeDJ_o=zeros(length(N),50);
avgPaths=zeros(length(N),1);
num_map = 50

for iiSTA=N % 30 scales
    sumPaths=0; % Total num of paths
    for iSTA=1:num_map % 50 random maps under the same scale
        nameMap=['newMaps2/Map' num2str(iiSTA) 'B' num2str(iSTA) '.mat'];
        load(nameMap); % Map
        dim=iiSTA; % num of nodes
        sumPaths=sumPaths+length(Map);
        
        ORIGI=unidrnd(dim); % Start node
        DESTI=unidrnd(dim); % End node
        while DESTI==ORIGI
            DESTI=unidrnd(dim); % If the Start node equals to the End node, re-random
        end

        
        disp('************atimeRA*************************');
        disp(nameMap);
        disp(['dim=' num2str(dim) ',' num2str(ORIGI) '--' num2str(DESTI)]);
        
        tic
        [Optimal, D]=DijkstraArithmetic(Map, dim, ORIGI, DESTI );
        tDJ_o=toc;

        %% Display %%%%

        disp(['Dijkstra_Old:' num2str(tDJ_o)]);
        Display(Optimal, D);
        disp('-----------------');
     
        %% Cache %%%%
        timeDJ_o(find(N==iiSTA),iSTA)=tDJ_o;
    end
    avgPaths(find(N==iiSTA),1)=round(sumPaths/num_map); % Calculate the avg num of paths
end

%% Final Save %%
save('data/btimeDJ_o.mat', 'timeDJ_o', '-v7');
save('data/bavgPaths.mat', 'avgPaths', '-v7');