solve :-
    member(A, [true, false]),
    member(B, [true, false]),
    member(C, [true, false]),
    member(D, [true, false]),
    
    % 1. (not(A); B)
    ( (not(A); B) -> C1 = 1 ; C1 = 0 ),
    % 2. (not(B); C; not(A))
    ( (not(B); C; not(A)) -> C2 = 1 ; C2 = 0 ),
    % 3. (D; A, not(C))
    ( (D; A, not(C)) -> C3 = 1 ; C3 = 0 ),
    % 4. (not(D); A)
    ( (not(D); A) -> C4 = 1 ; C4 = 0 ),
    
    C1 = 1, C2 = 1, C3 = 1, C4 = 1,
    
    write('A = '), write(A), nl,
    write('B = '), write(B), nl,
    write('C = '), write(C), nl,
    write('D = '), write(D), nl.

start :-
    nl,
    write('Logic task'), nl,
    solve.
