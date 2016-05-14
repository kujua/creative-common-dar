-module(darapi_handler_home).

% -behaviour(cowboy_http_handler).

-export([init/2]).
% -export([handle/2]).
% -export([terminate/3]).

init(Req, []) ->
  Req2 = cowboy_req:reply(200, [
		{<<"content-type">>, <<"text/plain">>}
	], <<"DAR API">>, Req),
	{ok, Req2, undefined}.

% handle(Req, State) ->
%   Body = <<"DAR API">>,
%   Headers = [{<<"content-type">>, <<"text/html">>}],
%   {ok, Reply} = cowboy_req:reply(200, Headers, Body, Req),
%   {ok, Reply, State}.
%
% terminate(_Reason, _Req, _State) ->
%   ok.
