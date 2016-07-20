#!/usr/bin/env escript
% -module(compiletemplates).

%% API exports
% -export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main([File, Module, Dir]) ->
    code:load_abs("_build/default/lib/erlydtl/ebin/erlydtl"),
    {F, Loaded} = code:is_loaded(erlydtl),
    io_lib:format("Loaded: ~p",[Loaded]),
    io_lib:format("File: ~p",[F]).
    % erlydtl:compile_file("templates/testpage.dtl", testpage_dtl).
    % erlydtl:compile(File, Module, [out_dir, Dir]).

%%====================================================================
%% Internal functions
%%====================================================================
