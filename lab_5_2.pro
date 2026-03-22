DOMAINS
    list = integer*
    
PREDICATES
    isSorted(list)
    read_list(integer, list)
    
CLAUSES
    isSorted([]).
    isSorted([_]).
    isSorted([X,Y|T]):- 
        X <= Y, 
        isSorted([Y|T]).
    
    read_list(0, []):-!.
    read_list(N, [H|T]):-
        N > 0,
        write("Enter element: "),
        readint(H),
        N1 = N - 1,
        read_list(N1, T).
    
GOAL
    write("Enter kol-vo elements: "),
    readint(Count),
    read_list(Count, List),
    write("List: "), write(List), nl,
    isSorted(List).