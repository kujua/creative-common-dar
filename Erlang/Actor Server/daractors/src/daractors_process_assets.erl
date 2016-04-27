-module daractors_process_assets.

-export ([
            start/1
        ]).


start(Message) ->
    % V = darapi_config:value(dardblib_nodename),
    J = rpc:call('dblib@localhost', 'Elixir.DarDblib', write_meta_to_collection, [dar_model:assetmetadata(<<"test5">>,<<"erlang">>,435216,<<"56">>)]),
    {J, Message}.
