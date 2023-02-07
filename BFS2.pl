% Define relation father-Child
father(72, 99).
father(72, 51).
father(99, 79).
father(51, 31).
father(79, 80).
father(31, 46).
father(31, 24).
father(80, 85).
father(24, 12).
father(85, 83).
father(12, 20).
father(83, 84).
father(83, 82).

% Implementation BFS
bfs(Start, Objetive, Path) :-
    bfs_search([[Start]], Objetive, Path).

bfs_search([[Objetive | Visited] | _], Objetive, [Objetive | Visited]) :-
    writef("Objetive found: %w\n", [Objetive | Visited]).
bfs_search([[Actual | Visited] | Queue], Objetive, Path) :-
    writef("Actual node: %w\n", [[Actual | Visited]]),
    findall([Child, Actual | Visited], (father(Actual, Child), \+ member(Child, Visited)), Childs),
    append(Queue, Childs, NuevaQueue),
    bfs_search(NuevaQueue, Objetive, Path).
