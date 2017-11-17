-module(httppost).
-author("Kim Kiogora <kimkiogora@gmail.com>").
-export([start/0]).

start()->io:format("Testing HTTP POST~n"),
	 Method = post,
	 URL = "my url",
	 Header = [],
	 Type = "application/json",
	 Body = "{
        		\"item\": \"YYY\",
        		\"value\": \"XXX\"
    		}
	 }",
	 HTTPOptions = [],
	 Options = [],
	 inets:start(),
	 try
	     R = httpc:request(Method, {URL, Header, Type, Body}, HTTPOptions, Options),
	     {ok, {{NewVersion, 200, NewReasonPhrase}, NewHeaders, NewBody}} = R,
	     Json = jiffy:decode(NewBody,[return_maps]),
	     Param = maps:get(<<"param">>, Json),
	     io:format("Response Status-> Desc ~s~n", [Param])	     
	 catch Class:Reason->
	     {badmatch,{X,Y}} = Reason,
	     {Z, W} = Y,
	     NewSet = lists:nth(2,W),
	     {A,B,C} = NewSet,
	     ActualReason = C,
	     io:format("Here exception ~p~n", [ActualReason])
	 end.
