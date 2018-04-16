%Daniel Bachler
%CSCI 305 Prolog Lab 2

%The mother predicate, works
mother(M,C) :-
    parent(M,C),
    female(M).

%Father predicate, works
father(F,C) :-
    parent(F,C),
    male(F).

%married predicate, works
spouse(M,F) :-
    married(M,F).

%Finds the parent of the child, works
child(C, P) :-
    parent(P,C).

%Given a parent, finds the son(s), works
son(P,S) :-
    parent(P,S),
    male(S).

%Given parent, finds daughters, works
daughter(P,D) :-
    parent(P,D),
    female(D).

%Given a person, finds their siblings, works
sibling(S1,S2) :-
    mother(M, S1), father(F, S1),
    mother(M, S2), father(F, S2),
    not(S1 = S2).

%given a person finds their brother(s), works
brother(S,B) :-
    sibling(S,B),
    male(B).

%Given a person, finds their sisters, works
sister(Sibling, S) :-
    sibling(Sibling, S),
    female(S).

%Blood uncle, works
uncle(U, N) :-
    parent(X, N),
    sibling(U,X).

%marriage uncle
uncle(U, N) :-
    parent(X, N),
    sibling(X, S),
    married(U, S).

%blood aunt
aunt(A, N) :-
    parent(P, N),
    sibling(A, P).

%marriage aunt
aunt(A, N) :-
    parent(P, N),
    sibling(P, S),
    married(S, A).

%grandparent
grandparent(GP, GC) :-
    parent(P, GC),
    parent(GP, P).

%grandfather
grandfather(GF, GC) :-
    grandparent(GF, GC),
    male(GF).

%grandmother
grandmother(GM, GC) :-
    grandparent(GM, GC),
    female(GM).

%grandchild
grandchild(GC, GP) :-
    parent(P, GC),
    parent(GP, P).




