DOMAINS
    list = integer*
    
PREDICATES
    nondeterm isMember(integer, list)
    intersection(list, list, list)
    delete(integer, list, list)
    listToSet(list, list)
    read_list(integer, list)
    
CLAUSES
    isMember(X, [X|_]).
    isMember(X, [_|T]) :- isMember(X, T).
    
    delete(_, [], []).
    delete(X, [X|L], L1) :- delete(X, L, L1), !.
    delete(X, [Y|L], [Y|L1]) :- delete(X, L, L1).
    
    listToSet([], []).
    listToSet([H|T], [H|T1]) :- 
        delete(H, T, T2), 
        listToSet(T2, T1).
    
    intersection([], _, []).
    intersection([H|T1], S2, [H|T]) :- 
        isMember(H, S2), 
        !, 
        intersection(T1, S2, T).
    intersection([_|T], S2, S) :- 
        intersection(T, S2, S).
    
    read_list(0, []):-!.
    read_list(N, [H|T]):-
        write("Enter element: "),
        readint(H),
        N1 = N - 1,
        read_list(N1, T).

GOAL
    write("Enter kol-vo list A: "),
    readint(CountA),
    read_list(CountA, A_raw),
    
    write("Enter kol-vo list B: "),
    readint(CountB),
    read_list(CountB, B_raw),
    
    listToSet(A_raw, A),
    listToSet(B_raw, B),
    intersection(A, B, C),
    
    write("Intersection (A and B): "), write(C), nl.
