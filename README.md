SLAPT
=========

Simple Lightweight Application for Prolog Testing

Test driven development in Prolog is a pain. With obscure built in test frameworks that don't make much sense, you can feel hurt and confused, like you've just been slapped in the face. Do you feel slapped? Maybe try SLAPT.

SLAPT is a very simple test framework which allows a developer to set up interchangeable test environments and run large suites of tests. It's lightweight and easy to use.

Usage
-----
We set up test environments as a list of Prolog facts which we would like defined for the duration of a particular test. We do this as follows:

```prolog
henry_father_of_jack_and_harry([
    father(henry, jack),
    father(henry, harry)
]).
```

We use the `with` predicate to run a test in a particular environment, for example:

```prolog
siblingTest :-
    with(henry_father_of_jack_and_harry,[
        sibling(jack, harry)
    ]).
```

We can then run our test using the `test` predicate. We use `good` to expect success, and `bad` to expect failure:

```prolog
:- test(siblingTest, good).
```

See the `example_tests.pl` for an example test suite.
