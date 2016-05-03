-module(dar_gfslib_process_files_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

-define (FILETEST, "filetest").
-define (FILETESTWRITE, "filetestwrite").
-define (FILETESTCONTENT, <<"test_from_gfslib">>).
-define (DARDB, "dar").

connect_to_server_test() ->
    R = dar_gfslib_process_files:connect(),
    ?assertEqual(true, R).

read_binary_test() ->
    R = dar_gfslib_process_files:read_binary(?FILETEST,?DARDB),
    ?assertEqual({ok,?FILETESTCONTENT}, R).

write_binary_test() ->
    R = dar_gfslib_process_files:write_binary(?FILETESTCONTENT,?FILETESTWRITE,?DARDB),
    ?assertEqual({ok,?FILETESTWRITE}, R).

read_from_gfs_test() ->
    R = dar_gfslib_process_files:read_from_gfs(?FILETEST,?DARDB),
    ?assertEqual({ok,?FILETESTCONTENT,?FILETEST}, R).

save_to_gfs_test() ->
    M = #{name => ?FILETESTWRITE,origin=>"test",timestamp=>100, gfsid=>"66"},
    R = dar_gfslib_process_files:save_to_gfs(?FILETESTCONTENT,M,?DARDB),
    ?assertEqual({ok,?FILETESTWRITE}, R).

connect_to_server_mocked_test() ->
    meck:new(mongodb,[passthrough]),
    meck:expect(mongodb, is_connected, fun(def) -> false end),
    R = dar_gfslib_process_files:connect(),
    ?assert(meck:validate(mongodb)),
    ?assertEqual(false, R),
    ok = meck:unload(mongodb).

-endif.
