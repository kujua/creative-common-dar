%%%-------------------------------------------------------------------
%% @doc darapi public API
%% @end
%%%-------------------------------------------------------------------

-module(darapi_app).

-behaviour(application).

%% Application callbacks
-export([start/2
        ,stop/1]).

-define(
ROUTES,
[
  {"/api/assets", darapi_handler_assets, []},
  {'_', darapi_handler_home, []}
]
).

%%====================================================================
%% API
%%====================================================================

start(_Type, _Args) ->
Dispatch = cowboy_router:compile([{'_', ?ROUTES}]),
{ok, _} = cowboy:start_http(
            http,
            100,
            [{port, darapi_config:value(port)}],
            [{env, [{dispatch, Dispatch}]}]
           ),
darapi_sup:start_link().


%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
