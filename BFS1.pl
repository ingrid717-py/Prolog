% Define relation father-Child
father(66, 31).
father(66, 79).
father(31, 20).
father(31, 51).
father(79, 72).
father(79, 80).
father(20, 12).
father(20, 24).
father(51, 46).
father(51, 60).
father(80, 82).
father(46, 48).

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
