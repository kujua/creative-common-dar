%%% @author Wolfgang Loder <kujuasiokubahatisha@gmail.com>
%%% @copyright 2016 Wolfgang Loder
%%% @doc
%%%
%%% @end

-module(api_SUITE).

-compile(export_all).
-include_lib("eunit/include/eunit.hrl").
-include_lib("common_test/include/ct.hrl").

-define (BODY_HOME, "<html>\n  <body>\n    \n      DAR API\n    \n  </body>\n</html>\n").
-define (BODY_TEST_GETASSETS, "<html>\n  <body>\n    \n      Test: get assets\n    \n  </body>\n</html>\n").

suite() ->
    [{timetrap,{seconds,10}}].

init_per_suite(Config) ->
    Config.

end_per_suite(Config) ->
    Config.

all() ->
  [
    http_get_home_message,
    http_test_getassets
  ].

%%% Tests

http_get_home_message(_Config) ->
    {ok, {{_Version, 200, _ReasonPhrase}, _Headers, Body}} =
        httpc:request(get, {"http://localhost:8402", []}, [], []),
    ct:pal("Body: ~p",[Body]),
    ?assertEqual(Body, ?BODY_HOME).

http_test_getassets(_Config) ->
  {ok, {{_Version, 200, _ReasonPhrase}, _Headers, Body}} =
      httpc:request(get, {"http://localhost:8402/test?testmode=get_apiassets", []}, [], []),
  ?assertEqual(Body, ?BODY_TEST_GETASSETS).

% gun_get_home_message(_Config) ->
%   {ok, ConnPid} = gun:open("localhost", 8402),
%   % {ok, _} = gun:await_up(ConnPid),
%   % StreamRef = gun:get(ConnPid, "/"),
%   % ?assertMatch({response, nofin, _, _}, gun:await(ConnPid, StreamRef)),
%   % {Resp, Body} = gun:await_body(ConnPid, StreamRef),
%   % ?assertMatch(ok,Resp),
%   % ?assertEqual(Body, ?BODY_HOME),
%   gun:shutdown(ConnPid).
