-module(daractors_process_json_tests).

-include_lib("eunit/include/eunit.hrl").

convert_to_json_test() ->
    ?assertEqual(   <<"{\"id\":99,\"meta\":[73,109,97,103,101]}">>,
                    daractors_process_json:convert_to_json(#{id=>99,meta=>"Image"})
                ).
