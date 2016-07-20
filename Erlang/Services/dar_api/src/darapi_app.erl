% {cowboy, {git, "git://github.com/ninenines/cowboy.git", {tag, "2.0.0-pre.3"}}},
-module(darapi_app).

-behaviour(application).
-compile([{parse_transform, lager_transform}]).
-export([start/2
        ,stop/1]).

-define(
  ROUTES,
    [
      {"/api/assets", darapi_handler_assets, []},
      {"/api/assets/:id/text", darapi_handler_assets, []},
      {"/api/assets/:id/images", darapi_handler_assets, []},
      {"/api/assets/:id/images/:imgid", darapi_handler_assets, []},
      {"/api/assets/:id", darapi_handler_assets, []},
      {"/test", darapi_handler_testpage, [{testmode,get_apiassets}]},
      {'_', darapi_handler_home, []}
    ]
).

start(_Type, _Args) ->
  erlydtl:compile_file("templates/testpage.dtl", testpage_dtl),
  erlydtl:compile_file("templates/homepage.dtl", homepage_dtl),
  Dispatch = cowboy_router:compile([{'_', ?ROUTES}]),
  lager:info("Compiled routes: ~p~n", [lager:pr(Dispatch, ?MODULE)]),
  P = 8402,
  {ok, _} = cowboy:start_http(
              http,
              100,
              [{port, P}],
              [{env, [{dispatch, Dispatch}]}]
             ),
  darapi_sup:start_link().


stop(_State) ->
    ok.
