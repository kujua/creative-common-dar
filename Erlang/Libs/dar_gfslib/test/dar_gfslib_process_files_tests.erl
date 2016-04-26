-module(dar_gfslib_process_files_tests).
-include_lib("eunit/include/eunit.hrl").

-define (FILETEST, "filetest").
-define (FILETESTWRITE, "filetestwrite").
-define (FILETESTCONTENT, <<"test_from_gfslib">>).
-define (DARDB, "dar").

connect_to_server_test() ->
    R = dar_gfslib_process_files:connect("",serverconnect),
    ?assertEqual({ok}, R).

connect_to_gfs_test() ->
    R = dar_gfslib_process_files:connect(?DARDB,gfsconnect),
    ?assertEqual({ok,?FILETESTCONTENT}, R).

connect_to_gfs_badarg_test() ->
    ?assertError(badarg, dar_gfslib_process_files:connect("notexistingserver",gfsconnect)).

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
    M = #{name => ?FILETESTWRITE,origin=>"test",timestamp=>100},
    R = dar_gfslib_process_files:save_to_gfs(?FILETESTCONTENT,M,?DARDB),
    ?assertEqual({ok,?FILETESTWRITE}, R).
