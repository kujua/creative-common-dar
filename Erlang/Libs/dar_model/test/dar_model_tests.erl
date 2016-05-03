-module (dar_model_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

dar_model_assetmetadata_empty_badmatch_test() ->
    ?assertError({badmatch,{}}, dar_model:validate_meta({})).

-endif.
