-module(darapi_handler_home).

-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_, Req, []) ->
  {ok, Req, undefined}.

handle(Req, State) ->
  Body = <<"DAR API">>,
  Headers = [{<<"content-type">>, <<"text/html">>}],
  {ok, Reply} = cowboy_req:reply(200, Headers, Body, Req),
  {ok, Reply, State}.

terminate(_Reason, _Req, _State) ->
  ok.
