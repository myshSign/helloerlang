-module(erlcount_sup).
-behaviour(supervisor).
-export([start_link/0,init/1]).

start_link()->
    io:format("erlcount_sup is staring... ~n",[]),
    supervisor:start_link(?MODULE,[])
        .
init([])->
    io:format("erlcount_sup is initing...~n",[]),
    MaxRestart=3,
    MaxTime=5000,
    {ok,{{one_for_one,MaxRestart,MaxTime},
         [{erlcount_dispatch,                           %id
           {erlcount_dispatch,start_link,[]},
           transient, 5000, worker, [erlcount_dispatch]
          }
         ]}}
        .
