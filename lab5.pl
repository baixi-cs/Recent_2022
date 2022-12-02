/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%   Xiaoqin  Bai                           %
%  baixi@oregonstate.edu                %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).


% your code here...


% F = female, M= male, C = child,
/* f is mom/dad of c due to f is female/male and f is parent of c */
mother(F, C):- parent(F, C), female(F).
father(M, C):- parent(M, C), male(M).


% use the ; operator (pronounced "or").
/* s1 is spouse of s2 due to they both married each other*/
spouse(S1, S2):- married(S1, S2); married(S2, S1). 			


/* c is child of y due to y is parent of c
c is son of y due to y is child of c && c is male
c is daughter of y due to y is child of c && c is female
*/
child(C, Y):- parent(Y, C).
son(C, Y):- child(C, Y), male(C).
daughter(C, Y):- parent(Y, C), female(C).


/* c is sibling of y due to they are all child of y and they are different individual
b1 is brother due to b1, s are sibling && b is male
s1 is daughter due to s1, s2 are sibling && s1 female
*/
sibling(C1, C2):- child(C1, Y), child(C2, Y), C1 \== C2.
brother(B1, S):- sibling(B1, S), male(B1).
sister(S1, S2):- sibling(S1, S2), female(S1).


/* u is uncle of d due to u is a brother of d-parent(p)
u is uncle of d due to u is a brother of d-father(p)
u is uncle of d due to u is a brother of d-mother(p)
u is uncle of d due to d is a child of parent(p), u also is sibling of p && male
u is uncle of d due to d is a child of parent(p), s also is sister of p && u is spouse of s
*/
uncle(U, D):- brother(U, P), parent(P, D).
uncle(U, D):- brother(U, P), father(P, D).
uncle(U, D):- brother(U, P), mother(P, D).
uncle(U, D):- child(D, P), sibling(P, U), male(U).
uncle(U, D):- child(D, P), sister(S, P), spouse(U, S).

uncle(U, D):- parent(P, D), sister(S, P), spouse(U, S).
uncle(U, D) :- parent(P, D), brother(U, P), \+ parent(U, D).


/* a is aunt of d due to u is a sister of d-parent(p)
a is aunt of d due to u is a sister of d-father(p)
a is aunt of d due to u is a sister of d-mother(p)
a is aunt of d due to d is a child of parent(p), a also is sibling of p && female
a is aunt of d due to d is a child of parent(p), s also is brother of p && a is spouse of s
*/
aunt(A, D):- sister(A, P), father(P, D).
aunt(A, D):- sister(A, P), mother(P, D).
aunt(A, D):- child(D, P), sibling(P, A), female(A).
aunt(A, D):- child(D, P), brother(S, P), spouse(A, S).

aunt(A, D):- child(D, P), brother(S, P), spouse(A, S).
aunt(A, D) :- parent(P, D), sister(A, P), \+ parent(A, D).


/* 
g is grandparent of x due to g is a parent of y && y is a parent of x
g is grandparent of x due to u is a dad of y && y is a parent of x
g is grandparent of f due to u is a mom of y && y is a parent of f
g is grandchild of c due to c grandparent of g
*/
grandparent(G, X):- parent(G, Y), parent(Y, X).
grandfather(G, X):- father(G, Y), parent(Y, X).
grandmother(G, F):- mother(G, Y), parent(Y, F).
grandchild(G, C):- grandparent(C, G).


/* 
a is ancestor of x due to a is a parent of y and a also is like a grandparent of x && y is a ancestor of x
d is descestor of x due to d is a child of y and d also is like a grandchild  of x && y is a descestor of x
*/
ancestor(A, X):- parent(A, X); parent(A, Y), ancestor(Y, X).
descendant(D, X):- child(D, X); child(D, Y), descendant(Y, X).


% born('King George III', 1738). 1900 < 1921 older.
% born('King George III', 1738). 1930 > 1921 younger.
% compare the second num born year, if less than means older
older(O, X):- born(O, F), born(X, S), F < S. 		
younger(Y, X):- born(Y, F), born(X, S), F > S.  


% born('Prince Albert', 1819), reigned('King George III', 1760, 1820). 
% not work start=S end= E born= mid= M.	start < born < end
regentWhenBorn(R, X):- born(X, M), reigned(R, S, E), S < M, M < E.	


/* 
c is cousin of x due to c is a child of y and y is sibling of z && x is kid of z me-child-> mom-sibling-> uncle-> parent->son
c is cousin of x due to u is uncle of c and u is a dad of x 
*/
cousin(C, X):- child(C, Y), sibling(Y, Z), parent(Z, X). 
cousin(C, X):- uncle(U, C), father(U, X). 


