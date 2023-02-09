% Define the graph as a list of edges (neighbors)
edge(a, b, 1).
edge(a, c, 2).
edge(b, d, 2).
edge(b, e, 3).
edge(c, d, 4).
edge(c, f, 1).
edge(d, g, 1).
edge(e, g, 5).
edge(f, g, 3).

% Define the heuristic function that estimates the cost to reach the goal
heuristic(g, 0).
heuristic(X, H) :- edge(X, Y, C), heuristic(Y, H2), H is H2 + C.

% Define the A* search algorithm
astar(Start, Goal, Path, Cost) :-
    astar(Start, Goal, [Start], Path, Cost).

astar(Goal, Goal, Path, Path, 0).
astar(Current, Goal, Visited, Path, Cost) :-
    edge(Current, Next, C),
    not(member(Next, Visited)),
    heuristic(Next, H),
    F is C + H,
    astar(Next, Goal, [Next|Visited], Path, Cost2),
    Cost is Cost2 + C.

% Find the shortest path from start to goal
find_path(Start, Goal) :-
    astar(Start, Goal, Path, Cost),
    write('Path: '), write(Path),
    write(', Cost: '), write(Cost).
