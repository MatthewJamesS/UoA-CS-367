/* 
                        Problem Outline:

solution(+Path, +RoadNetwork, -SolutionCost, -SolutionPath).

"-" = an output

                        Inputs:
Path: a list of cities, in reverse order of being visited 
(e.g., the last city inthe list is the first city in the tour)

RoadNetwork: a description of all the directed roads between cities andtheir cost

                        Outputs:
SolutionCost: the cost of a tour of network.
SolutionPath: the tour for which SolutionCost was computed.

Tour def:
- every city in network appears  in the list at least once
- starting city only one allowed to appear 2 times
- starting city must appear 2 times exactly
-  list contains exactly one more element than there is citys
    eg citys a and b exist --> list = [a,b,a] (a starting city)

- If there is no "road" back to start node then solution = false

Optimal solution not needed just need a solution

*/

/*
Plan:

Make inputs : path, roadnetwork,
Outputs: solutioncost, solutionpath

Path = a list of cities in reverse order of being visited
RoadNetwork = description of all directed roads

*/

 solution(+Path, +RoadNetwork, -SolutionCost, -SolutionPath) :-
 
