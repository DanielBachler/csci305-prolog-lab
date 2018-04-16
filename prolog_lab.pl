%Daniel Bachler
%CSCI 305 Prolog Lab 2

mother(M,C) :-
    parent(M,C),
    female(M).

father(F,C) :-
    parent(F,C),
    male(F).

%not sure what second rule is
spouse(M,F) :-
    married(M,F).

%Again not sure what second rule is
child(P,C) :-
    parent(P,C).

son(P,S) :-
    parent(P,S),
    male(S).

daughter(P,D) :-
    parent(P,D),
    female(D).

sibling(S1,S2) :-
    parent(P1,S1),
    parent(P2,S2),
    =(P1,P2).

brother(S,B) :-
    sibling(S,B),
    male(B).

sister(Sibling, S) :-
    sibling(Sibling, S),
    female(S).


