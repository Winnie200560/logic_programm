PREDICATES
    step(integer,integer)
    sum_digit(integer,integer)

CLAUSES
    sum_digit(0,0):-!.
    sum_digit(N,S):- C = N mod 10, N1 = N div 10, sum_digit(N1,S1), S = S1 + C.

    step(0,0):-!.
    step(N,D):- N > 0, sum_digit(N,S), N1 = N - S, step(N1,D1), D = D1 + 1.

GOAL
    write("Number: "), readint(N), step(N,C), write("Steps = "), write(C).