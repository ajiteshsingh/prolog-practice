% P01
% Find the last element of a list.
% Example:
% ?- my_last(X,[a,b,c,d]).
% X = d

my_last(LastElement, [LastElement]).
my_last(LastElement, [_|Tail]) :- my_last(LastElement, Tail).




% P02
% Find the last but one element of a list.

second_last(SecondLast, [SecondLast, _]).
second_last(SecondLast, [_|Tail]) :- second_last(SecondLast, Tail).




% P03
% Find the Kth element of a list.
% The first element in the list is number 1.
% Example:
% ?- element_at(X,[a,b,c,d,e],3).
% X = c

element_at(Element, [Element|_], 1).
element_at(Element, [_|Tail], Count) :- 
    NewCount is Count - 1,
    element_at(Element, Tail, NewCount).


% P04 
% Find the number of elements of a list.

num_of_elements([], Length):- Length is 0.
num_of_elements([_|Tail], Length):-
    num_of_elements(Tail, LengthOfTail),
    Length is LengthOfTail + 1.

% P05
% Reverse a list

reverse_list([], X, X).
reverse_list([Head|Tail], X, Acc) :- reverse_list(Tail, X, [Head|Acc]).


% P06 
% Find if list is a palindrome or not

reverse1([],X,X).
reverse1([X|Y],Z,T) :- reverse1(Y,[X|Z],T).

palindrome(X) :- reverse1(X, [], X).

% P07
% Flatten a nested list structure.
% Transform a list, possibly holding lists as elements into a flat list by replacing each list with its elements (recursively).
% Example:
% ?- my_flatten([a, [b, [c, d], e]], X).
% X = [a, b, c, d, e]

my_flatten(X, [X]) :- \+ is_list(X).
my_flatten([], []).
my_flatten([Head| Tail], Acc) :-
    my_flatten(Head, Result1),
    my_flatten(Tail, Result2),
    append(Result1, Result2, Acc).

% P08
% Eliminate consecutive duplicates of list elements.
% If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
% Example:
% ?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
% X = [a,b,c,a,d,e]

compress([], []).
compress([X], [X]).
compress([X,X|Tail], Result) :- compress([X|Tail], Result).
compress([X, Y|T1], [X|Result]) :- compress([Y|T1], Result).

/*
 P09
 Pack consecutive duplicates of list elements into sublists.
 If a list contains repeated elements they should be placed in separate sublists.
 Example:
 ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
 X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
*/


pack([], []).
pack([X], [[X]]).
pack([X, X | Tail], [[X| Zs]| Z]) :- pack([X|Tail], [Zs| Z]).
pack([X, Y|Tail], [[X]| Z]) :- pack([Y|Tail], Z).

/*
    P10
    Run-length encoding of a list.
    Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

    Example:
    ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
    X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]
*/

calculate_occurrance(L, [Element, Count]) :-
    L = [Element|_],
    length(L, Count).

encode(L, X):-
    pack(L, Y),
    maplist(calculate_occurrance, Y, X).



