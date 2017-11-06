%% Four suspects a, b, c, and d were rounded up for questioning concerning a robbery. It
%% was known for sure that at least one of them was guilty and that no one outside these four
%% were involved. The following facts turned up:
%% 1. a was definitely innocent.
%% 2. if b was guilty then he had exactly one accomplice.
%% 3. if c was guilty then he had exactly two accomplices.

%% You need to write a predicate, solve(Guilty), which when called with a variable will
%% return one of the possible gangs (as lists) of people who could have committed the
%% robbery together, given the facts above. Your predicate needs to handle redo's, i.e., after
%% your predicate returns at the top-level, if you type in a ";" then if there is another gang
%% that could have committed the crime, then it should be returned, when there are no more
%% gangs that could have committed the crime together then it should fail.

%% create sovle function to find out suspects
sovle(Guilty) :-

%% get all sub lists of suspects a,b,c,d
subListOf(Guilty,[a,b,c,d]),

%%Eliminate all sublists contains a
not(contains(a,Guilty)),

%%Get length of the guilty list
length(Guilty, Length),

%% make sure at least one of them was guilty 
Length>=1,

/* 
if b in the guilty list then the list length is 2, OR lists does not contain b
AND
if c in the guilty list then the list length is 3, OR lists does not contain c
*/
( contains(b,Guilty)-> Length=2; not(contains(b,Guilty)) ) , ( contains(c,Guilty) -> Length=3; not(contains(c,Guilty)) ).

/* 
Contains function
Check if a list contains a certain element
*/
contains(Element, [Element|_]). % Base case
contains(Element, [_|Tail]) % Recursion
    :- contains(Element, Tail).

/* 
Contains function
get sublists of a given list
*/
subListOf([],[]).
subListOf([X|L],[X|S]) :-
   subListOf(L,S).
subListOf(L, [_|S]) :-
   subListOf(L,S).