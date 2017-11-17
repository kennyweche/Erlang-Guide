-module(logger).
-author("kim kiogora <kimkiogora@gmail.com>").
-export([start/0,log/2]).

%Entry point
start()->
	log("TestLog","Hello, this is a test log message !"),
	ok.

%Create a file and append a Log message to it
log(Path, Message)->
	{ok, S} = file:open([Path], [append]),
	Now = io_lib:format("~s",[current_time()]),
	io:format(S, "~s| ~s~n", [Now, Message]),
	file:close(S).

%Gets the current time
current_time()->
        {{Year,Month,Day},{Hour,Min,Sec}} = calendar:local_time(),
        Mstr = element(Month,{"Jan","Feb","Mar","Apr","May","Jun","Jul",
                             "Aug","Sep","Oct","Nov","Dec"}),
        list_to_binary(io_lib:format("~4w-~s-~2w ~2.2.0w:~2.2.0w:~2.2.0w",[Year,Mstr,Day,Hour,Min,Sec])).

