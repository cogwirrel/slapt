% SLAPT
% Simple Light Application for Prolog Testing

% Run an individual test T
% good indicates that we expect success
% bad indicates that we expect failure
test(T) :- test(T, good).

test(T, good) :-
	write('Test: '),
	write(T),
	write(' - '),
	(call(T) -> 
		write('PASS\n');
		write('FAIL\n')).

test(T, bad) :-
	write('Test: '),
	write(T),
	write(' - '),
	(call(T) -> 
		write('FAIL\n');
		write('PASS\n')).

% Run a test with a set of facts
% Use to set up an environment for a test
with(Facts, TS) :-
	defFacts(Facts),
	(callAll(TS) ->
		undefFacts(Facts);
		undefFacts(Facts), fail).

callAll([]).
callAll([H|T]) :-
	call(H),
	callAll(T).

defFacts(Facts) :-
	resolveFacts(assert, Facts).

undefFacts(Facts) :-
	resolveFacts(retract, Facts).

resolveFacts(Fun, Facts) :-
	call(Facts, X),
	fact(Fun, X).

fact(_, []).
fact(Fun, [H|T]) :-
	call(Fun,H),
	fact(Fun,T).