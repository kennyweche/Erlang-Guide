% This is an example for finding the square of numbers in a list
-module(lcompre).
-author("kim kiogora <kimkiogora@gmail.com>").
-export([start/0]).

start()->
	Mylist = [1,2,3,4,5],
        io:format("List -> ~p~n",[Mylist]),
	io:format("About to work>>>~n"),
	T=[b(Y)||Y<-Mylist],	
	io:format("Comprehension ~p~n",[T]),
	ok.

b(X)->
	X*X.
