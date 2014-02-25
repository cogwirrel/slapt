% Return whether Child1 and Child2 are siblings
sibling(Child1, Child2) :-
	father(Father, Child1),
	father(Father, Child2).