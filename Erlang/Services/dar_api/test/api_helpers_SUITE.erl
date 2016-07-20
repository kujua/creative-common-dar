%%% @author Wolfgang Loder <kujuasiokubahatisha@gmail.com>
%%% @copyright 2016 Wolfgang Loder
%%% @doc
%%%
%%% @end

-module(api_helpers_SUITE).

-compile(export_all).
% -include_lib("eunit/include/eunit.hrl").
-include_lib("common_test/include/ct.hrl").

suite() ->
    [{timetrap,{minutes,10}}].

init_per_suite(Config) ->
    Config.
    % {ok, App_Start_List} = start([darapi_handler_assets]),
    % inets:start().
    % [{app_start_list, App_Start_List}|Config].

end_per_suite(Config) ->
    % inets:stop(),
    % stop(?config(app_start_list, Config)),
    Config.


% init_per_group(_GroupName, Config) ->
%   Config.
%
% end_per_group(_GroupName, _Config) ->
%   ok.
%
% init_per_testcase(_TestCase, Config) ->
%   Config.
%
% end_per_testcase(_TestCase, _Config) ->
%   ok.
%
% groups() ->
%   [].

all() ->
  [http_get_new_uuid].

%%% Tests

http_get_new_uuid(_Config) ->
    U = darapi_helpers:new_uuid(self()),
    % ?assert(io_lib:printable_list(U)),
    % RegExp = "^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$",
    % ?assertMatch({match,_}, re:run(U, RegExp)).
    RegExp = "^90890*",

    case re:run(U, RegExp) of
      {match,_} -> {ok};
      _ -> {error}
    end.
% start(Apps) ->
%     {ok, do_start(_To_start = Apps, _Started = [])}.
%
% do_start([], Started) ->
%     Started;
% do_start([App|Apps], Started) ->
%     case application:start(App) of
%     ok ->
%         do_start(Apps, [App|Started]);
%     {error, {not_started, Dep}} ->
%         do_start([Dep|[App|Apps]], Started)
%     end.
%
% stop(Apps) ->
%     _ = [ application:stop(App) || App <- Apps ],
%     ok.
