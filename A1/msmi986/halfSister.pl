%%Rule Base for half sister program
female(mary).
female(ann).
parentOf(sue, mary).
parentOf(ed,mary).
parentOf(sue,ann).
parentOf(sam,ann).

%% logical statement to prove half sister relation
halfSisterOf(Y,Z) :- (parentOf(X,Y), parentOf(X,Z)), (parentOf(A,Y), not(parentOf(A,Z))), female(Y).