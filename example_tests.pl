:- [slapt].
:- [example].

%%% Run all of the tests %%%
test :-
	test(siblingTest, good),
	test(notSiblingTest, bad).

%%% Environments %%%
henry_father_of_jack_and_harry([
	father(henry, jack),
	father(henry, harry)
]).

%%% Tests %%%
siblingTest :-
	with(henry_father_of_jack_and_harry,[
		sibling(jack, harry)
	]).

notSiblingTest :-
	with(henry_father_of_jack_and_harry,[
		sibling(henry, jack)
	]).
