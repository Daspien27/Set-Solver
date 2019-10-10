color(red).
color(green).
color(purple).

shape(oval).
shape(squiggle).
shape(diamond).

pattern(solid).
pattern(clear).
pattern(stripe).

rank(1).
rank(2).
rank(3).

card(A, B, C, D) :- color(A), shape(B), pattern(C), rank(D).

valid_set(A, A, A) :- !.
valid_set(A, B, C) :- A \= B, B \= C, A \= C, !.

valid_list([],[],[]).
valid_list([H1|T1], [H2|T2], [H3|T3]) :- valid_set(H1,H2,H3), valid_list(T1,T2,T3).

valid_sets([Card1Color, Card1Shape, Card1Fill, Card1Rank],
      [Card2Color, Card2Shape, Card2Fill, Card2Rank],
      [Card3Color, Card3Shape, Card3Fill, Card3Rank]) :-
    active(Card1Color, Card1Shape, Card1Fill, Card1Rank),
    active(Card2Color, Card2Shape, Card2Fill, Card2Rank),
    active(Card3Color, Card3Shape, Card3Fill, Card3Rank),
    valid_set(Card1Color, Card2Color, Card3Color),
    valid_set(Card1Shape, Card2Shape, Card3Shape),
    valid_set(Card1Fill, Card2Fill, Card3Fill),
    valid_set(Card1Rank, Card2Rank, Card3Rank).

duplicates(A,A,A).

find_sets(A, B, C) :- valid_sets(A,B,C), not(duplicates(A,B,C)), valid_list(A,B,C).

%Cards in game go here:
active(red, squiggle, solid, 2).
active(green, diamond, stripe, 3).
active(green, diamond, stripe, 2).
active(green, squiggle, stripe, 2).

active(green, oval, solid, 3).
active(green, oval, stripe, 2).
active(red, diamond, solid, 3).
active(green, squiggle, solid, 2).

active(green, diamond, clear, 1).
active(purple, oval, clear, 3).
active(green, diamond, solid, 3).
active(green, oval, clear, 1).

%type "find_sets(Card1, Card2, Card3)" interactively, then ctrl-enter
