% {cowboy, {git, "git://github.com/ninenines/cowboy.git", {tag, "2.0.0-pre.3"}}},
-module(darapi_app).

-behaviour(application).

-export([start/2
        ,stop/1]).

-define(
  ROUTES,
    [
      {"/api/assets", darapi_handler_assets, []},
      {"/api/assets/:id", darapi_handler_assets, []},
      {"/test", darapi_handler_testpage, []},
      {'_', darapi_handler_home, []}
    ]
).

start(_Type, _Args) ->
Dispatch = cowboy_router:compile([{'_', ?ROUTES}]),
{ok, _} = cowboy:start_http(
            http,
            100,
            [{port, darapi_config:value(port)}],
            [{env, [{dispatch, Dispatch}]}]
           ),
darapi_sup:start_link().


stop(_State) ->
    ok.
