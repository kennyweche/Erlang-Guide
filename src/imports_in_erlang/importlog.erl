-module(importlog).
-export([start/0]).
-import(logger,[log/2]).
-define(log_path,"test_log.log").

start()->
	logger:log([?log_path], "This is an example of an import"),
	ok.

