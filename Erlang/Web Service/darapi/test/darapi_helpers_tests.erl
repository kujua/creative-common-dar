-module(darapi_helpers_tests).
-include_lib("eunit/include/eunit.hrl").

config_value_port_test() ->
    ?assertEqual(8401, darapi_config:value(port)).
