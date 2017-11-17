-module(redissamp).
-export([start/0]).

start()->
	{ok, C} = eredis:start_link(),
	io:format("Got redis connection~p~n",[C]),
	{ok, S} = eredis:q(C, ["SET", "foo", "bar"]),
	io:format("Set redis data ~p~n",[S]),
	{ok, D} = eredis:q(C, ["GET", "foo"]),
	io:format("Got redis data ~p~n",[D]).
