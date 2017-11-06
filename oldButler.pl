%% Write a prolog predicate “oldButler” which returns unmarried men over the age of 45. In
%% other words, oldButler(X) is only true if X is an unmarried man over the age of 45. The
%% prolog database will have primitive clauses of the type: married(Person), gender(Person,
%% Gender), and age(Person, Age), where Gender is either male or female, and Age is a
%% positive integer. You should put your prolog definition in a file named oldButler.pl.

:- discontiguous gender/2.
:- discontiguous age/2.
:- discontiguous married/1.
gender(mike, male).
married(mike).
age(mike, 68).
gender(john, male).
age(john, 60).
gender(frank, male).

oldButler(X) :- 
	age(X, N),N>45,
	gender(X, male),
	not(married(X)).