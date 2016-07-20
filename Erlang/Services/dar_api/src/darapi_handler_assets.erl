-module(darapi_handler_assets).

-compile([{parse_transform, lager_transform}]).

-export([init/3]).
-export([allowed_methods/2]).
-export([content_types_provided/2]).
-export([content_types_accepted/2]).
-export([post_handler/2]).
-export([get_handler/2]).

-record (getopts,
          {
            path = "",
            type = undefined
          }).

init(_Transport, _Req, []) ->
	{upgrade, protocol, cowboy_rest}.

allowed_methods(Req, State) ->
  {[<<"GET">>, <<"POST">>], Req, State}.

content_types_accepted(Req, State) ->
    {[{{<<"application">>, <<"json">>, []}, post_handler}], Req, State}.

content_types_provided(Req, State) ->
	{[
		{<<"application/json">>, get_handler}
	], Req, State}.

post_handler(Req, State) ->
  {Method, _} = cowboy_req:method(Req),
  % lager:info("from_json: Method~p~n", [lager:pr(Method, ?MODULE)]),
  % lager:error("from_json: Method~p~n", [lager:pr(Method, ?MODULE)]),
	% io:format("from_json: Method~p~n", [Method]),
  {Path, _} = cowboy_req:path(Req),
  % io:format("from_json: Path~p~n", [Path]),
  {ok, B, Req2} = cowboy_req:body_qs(Req),
  % io:format("from_json: Req~p~n", [Req]),
  B1 = after_decode(B),
  % io:format("from_json: B: ~p~n", [B1]),
  {AllValues, _} = cowboy_req:qs_vals(Req),
  % io:format("from_json: QS: ~p~n", [AllValues]),
  Vq2 = get_qsvalue(Req,<<"q2">>),
  % io:format("from_json: q2: ~p~n", [Vq2]),
	Body = get_assets(Req, State),
	% io:format("from_json: Body~p~n", [Body]),
  Resp = cowboy_req:set_resp_body(Body, Req2),
  % io:format("from_json: Req3~p~n", [Req3]),
	{true, Resp, State}.

get_handler(Req, State) ->
  % {Method, _} = cowboy_req:method(Req),
	% io:format("fo_json: Method: ~p~n", [Method]),
  {Path, _} = cowboy_req:path(Req),
  lager:info("get_handler path: ~p~n", [lager:pr(Path, ?MODULE)]),
  % U = darapi_helpers:new_uuid(self()),
  Body = get_assets(Req, State),
	{Body, Req, State}.

get_json(Req, State) ->
  % J = daractors_process_json:convert_to_json(#{id=>99,meta=><<"Image">>}),
  % V = darapi_config:value(daractor_nodename),
  % J = rpc:call('actor@localhost', daractors_process_json, convert_to_json, [#{id=>101,meta=><<"Image2">>}]),
  {"", Req, State}.

get_assets(Req,State) ->
  R = daractors_process_assets:start(#{process => undefined}),
  daractors_process_json:convert_to_json(R).

% helpers

after_decode(C) ->
  {J,_} = hd(C),
  jsone:decode(J).

get_qsvalue(Req, Key) ->
  {V, _} = cowboy_req:qs_val(Key, Req),
  V.
