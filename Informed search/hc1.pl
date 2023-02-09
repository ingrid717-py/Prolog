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

% Define the steepest ascent hill climbing algorithm
hill_climbing(Start, Goal, Path, Cost) :-
    hill_climbing(Start, Goal, [Start], Path, Cost).

hill_climbing(Goal, Goal, Path, Path, 0).
hill_climbing(Current, Goal, Visited, Path, Cost) :-
    findall(C-Next, (edge(Current, Next, C), not(member(Next, Visited))), Options),
    sort(Options, SortedOptions),
    reverse(SortedOptions, DescendingOptions),
    member(C-Next, DescendingOptions),
    hill_climbing(Next, Goal, [Next|Visited], Path, Cost2),
    Cost is Cost2 + C.

% Find the path to the goal with the steepest ascent hill climbing algorithm
find_path(Start, Goal) :-
    hill_climbing(Start, Goal, Path, Cost),
    write('Path: '), write(Path),
    write(', Cost: '), write(Cost).