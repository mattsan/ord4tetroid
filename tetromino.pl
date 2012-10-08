str2pos([X00, Y00, C, X01, Y01, C, X02, Y02, C, X03, Y03], [[X10, Y10], [X11, Y11], [X12, Y12], [X13, Y13]]) :-
    X10 is X00 - 48, Y10 is Y00 - 48,
    X11 is X01 - 48, Y11 is Y01 - 48,
    X12 is X02 - 48, Y12 is Y02 - 48,
    X13 is X03 - 48, Y13 is Y03 - 48,
    C =:= 44.

normalize([[X00, Y00], [X01, Y01], [X02, Y02], [X03, Y03]], [[X10, Y10], [X11, Y11], [X12, Y12], [X13, Y13]]) :-
    min_member(Xmin, [X00, X01, X02, X03]), min_member(Ymin, [Y00, Y01, Y02, Y03]),
    X10 is X00 - Xmin, Y10 is Y00 - Ymin,
    X11 is X01 - Xmin, Y11 is Y01 - Ymin, 
    X12 is X02 - Xmin, Y12 is Y02 - Ymin, 
    X13 is X03 - Xmin, Y13 is Y03 - Ymin.
normalize([_,_,_], [ [0,0], [0,0], [0,0], [0,0] ]). 
normalize([_,_],   [ [0,0], [0,0], [0,0], [0,0] ]). 
normalize([_],     [ [0,0], [0,0], [0,0], [0,0] ]). 

tetromino([ [0, 0], [0, 1], [0, 2], [1, 2] ], 'L') :- !.
tetromino([ [0, 0], [0, 1], [1, 0], [2, 0] ], 'L') :- !.
tetromino([ [0, 0], [1, 0], [1, 1], [1, 2] ], 'L') :- !.
tetromino([ [0, 1], [1, 1], [2, 0], [2, 1] ], 'L') :- !.
tetromino([ [0, 0], [0, 1], [1, 1], [2, 1] ], 'L') :- !.
tetromino([ [0, 0], [0, 1], [0, 2], [1, 0] ], 'L') :- !.
tetromino([ [0, 0], [1, 0], [2, 0], [2, 1] ], 'L') :- !.
tetromino([ [0, 2], [1, 0], [1, 1], [1, 2] ], 'L') :- !.
tetromino([ [0, 0], [1, 0], [2, 0], [3, 0] ], 'I') :- !.
tetromino([ [0, 0], [0, 1], [0, 2], [0, 3] ], 'I') :- !.
tetromino([ [0, 0], [1, 0], [1, 1], [2, 0] ], 'T') :- !.
tetromino([ [0, 0], [0, 1], [0, 2], [1, 1] ], 'T') :- !.
tetromino([ [0, 1], [1, 0], [1, 1], [2, 1] ], 'T') :- !.
tetromino([ [0, 1], [1, 0], [1, 1], [1, 2] ], 'T') :- !.
tetromino([ [0, 0], [0, 1], [1, 0], [1, 1] ], 'O') :- !.
tetromino([ [0, 0], [0, 1], [1, 1], [1, 2] ], 'S') :- !.
tetromino([ [0, 1], [0, 2], [1, 0], [1, 1] ], 'S') :- !.
tetromino([ [0, 1], [1, 0], [1, 1], [2, 0] ], 'S') :- !.
tetromino([ [0, 0], [1, 0], [1, 1], [2, 1] ], 'S') :- !.
tetromino(_, '-').

solve([]).
solve([S0|SS]) :- str2pos(S0, P0), sort(P0, P1), normalize(P1, P2), tetromino(P2, R2), writeln(R2), solve(SS).

result :- see('testpattern.txt'), read(SS), seen, solve(SS).
