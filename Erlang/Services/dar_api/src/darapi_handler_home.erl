-module(darapi_handler_home).

% -behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

% init(Req, []) ->
%   Req2 = cowboy_req:reply(200, [
% 		{<<"content-type">>, <<"text/plain">>}
% 	], <<"DAR API">>, Req),
% 	{ok, Req2, undefined}.

init(_Type, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
  {ok, Body} = homepage_dtl:render([]),
  % Body = <<"DAR API\n">>,
  Headers = [{<<"content-type">>, <<"text/html">>}],
  {ok, Reply} = cowboy_req:reply(200, Headers, Body, Req),
  {ok, Reply, State}.

terminate(_Reason, _Req, _State) ->
  ok.
