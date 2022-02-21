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



