1. ﻿Folders:
1)data: 
	Stores all .mat files. The .mat files record time consumption of each algorithm in different maps.
2)newMaps2: 
	Stores all maps. There are 30 different scales and there are 50 random maps under each scale, that is, we tested 1500 maps totally.


2. .m files:
1)main.m:
	Run it to test 4 algorithm in 1500 maps. Time consumption is stored as output in .mat files, data folder.

2)main_make_map.m:
	Run it to generate 1500 maps. We use Dijkstra to make sure every map is a connected graph.

3)OrderMap.m:
	Change an adjacency table to an adjacency matrix.

4)Dijkstra_Arithmetic.m , AS_Arithmetic.m , BF_Arithmetic.m , resonanceAlg:
	Guide code of Dijkstra, Astar , Bellman-Ford and Resonance Algorithom.

5)Compute.m , Compute_AS.m , Compute_BF.m:
	Core code of Dijkstra, Astar and Bellman-Ford.

6)make_time_table.m:
	Through Dijkstra, create a timetable as a heuristic function h() of the AS algorithm.

7)Forward.m , Backward.m , FindPaths.m :
	Core code of Resonance Algorithm. Corresponding to the forward, backward, and overlapping processes of the Resonance Algorithm.

8)NodesBook.m:
	Gives which node links to which in Resonance Algorithm.

9)print_path.m: 
	Recurse to organize the shortest path into an easy-to-read form.

10)Display.m , DispPaths.m:
	Display.


