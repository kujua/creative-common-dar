-module darapi_config.

-export([value/1]).

value(Name) ->
    {ok, V} = application:get_env(darapi_configuration, Name),
    V.
