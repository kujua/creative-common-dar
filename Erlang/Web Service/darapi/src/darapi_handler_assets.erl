-module(darapi_handler_assets).

% -behaviour(cowboy_http_handler).

-export([init/2]).
-export([content_types_provided/2]).
-export([hello_to_html/2]).
-export([hello_to_json/2]).
-export([hello_to_text/2]).
-export([get_json/2, get_assets/2]).

init(Req, Opts) ->
	{cowboy_rest, Req, Opts}.

% allowed_methods(Req, _) ->
%   {[<<"HEAD">>, <<"GET">>, <<"POST">>], Req, #{}}.

content_types_provided(Req, State) ->
	{[
		{<<"text/html">>, hello_to_html},
		{<<"application/json">>, hello_to_json},
		{<<"text/plain">>, hello_to_text}
	], Req, State}.

hello_to_html(Req, State) ->
	Body = <<"<html>
<head>
	<meta charset=\"utf-8\">
	<title>REST Hello World!</title>
</head>
<body>
	<p>REST Hello World as HTML!</p>
</body>
</html>">>,
	{Body, Req, State}.

hello_to_json(Req, State) ->
	% Body = <<"{\"rest\": \"Hello World!\"}">>,
  Body = get_assets(Req, State),
	{Body, Req, State}.

hello_to_text(Req, State) ->
	{<<"REST Hello World as text!">>, Req, State}.

get_json(Req, State) ->
  % J = daractors_process_json:convert_to_json(#{id=>99,meta=><<"Image">>}),
  % V = darapi_config:value(daractor_nodename),
  % J = rpc:call('actor@localhost', daractors_process_json, convert_to_json, [#{id=>101,meta=><<"Image2">>}]),
  {"", Req, State}.

get_assets(Req,State) ->
  R = daractors_process_assets:start(#{process => undefined}),
  Ret = daractors_process_json:convert_to_json(R).
