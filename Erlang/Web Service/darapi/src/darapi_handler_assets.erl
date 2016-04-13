-module(darapi_handler_assets).

% -behaviour(cowboy_http_handler).

-export([init/3]).
-export([content_types_provided/2]).
-export([allowed_methods/2]).
-export([get_json/2]).

init(_Transport, _Req, []) ->
  {upgrade, protocol, cowboy_rest}.

allowed_methods(Req, _) ->
{[<<"HEAD">>, <<"GET">>, <<"POST">>], Req, #{}}.

content_types_provided(Req, State) ->
{[{{<<"application">>, <<"json">>, '*'}, get_json}], Req, State}.

get_json(Req, State) ->
  J = daractors_process_json:convert_to_json(#{id=>99,meta=><<"Image">>}),
  {J, Req, State}.
