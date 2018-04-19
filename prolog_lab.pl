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
son(S, P) :-
    parent(P,S),
    male(S).

%Given parent, finds daughters, works
daughter(D, P) :-
    parent(P,D),
    female(D).

%Given a person, finds their siblings, works
sibling(S1,S2) :-
    mother(M, S1), father(F, S1),
    mother(M, S2), father(F, S2),
    not(S1 = S2).

%given a person finds their brother(s), works
brother(B, S) :-
    sibling(S,B),
    male(B).

%Given a person, finds their sisters, works
sister(S, Sibling) :-
    sibling(Sibling, S),
    female(S).

%Blood uncle, works
uncle(U, N) :-
    parent(X, N),
    sibling(U,X),
    male(U).

%marriage uncle
uncle(U, N) :-
    parent(X, N),
    sibling(X, S),
    married(U, S),
    male(U).

%blood aunt, works
aunt(A, N) :-
    parent(P, N),
    sibling(P, A),
    female(A).

%marriage aunt
aunt(A, N) :-
    parent(P, N),
    sibling(P, S),
    married(S, A),
    female(A).

%grandparent, works, find the grandchildren of a given Grandparent
grandparent(GP, GC) :-
    parent(P, GC),
    parent(GP, P).

%grandfather, works
grandfather(GF, GC) :-
    grandparent(GF, GC),
    male(GF).

%grandmother, works
grandmother(GM, GC) :-
    grandparent(GM, GC),
    female(GM).

%grandchild, works
grandchild(GC, GP) :-
    parent(P, GC),
    parent(GP, P).

%Ancestor/2, ancestor(X,Y) means X is ancestor of Y
ancestor(X,Y) :-
    parent(X, Y).
%Other rule for ancestor, if not immediate family.
ancestor(X,Y) :-
    parent(P, Y),
    ancestor(X, P).

%descendant/2, descendant(X,Y) means X is descendant of Y
descendant(X,Y) :-
    parent(Y, X).
%Second rule for case where not immediate descendant
descendant(X,Y) :-
    child(C, Y),
    descendant(X, C).

%older, compares if X is older than Y
older(X, Y) :-
    born(X, X_1),
    born(Y, Y_1),
    X_1 < Y_1.

%Younger, compares if X is younger than Y
younger(X, Y) :-
    born(X, X_1),
    born(Y, Y_1),
    X_1 > Y_1.


%Gets the ruler when X was born
regentWhenBorn(X, Y) :-
    born(Y, Y_1),
    reigned(X, X_1, X_2),
    X_1 < Y_1,
    Y_1 < X_2.

%Extra credit cousin rule
cousin(X, Y) :-
    parent(P_X, X),
    parent(P_Y, Y),
    sibling(P_X, P_Y).
