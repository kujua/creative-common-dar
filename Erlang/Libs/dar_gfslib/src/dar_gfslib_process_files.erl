-module(dar_gfslib_process_files).

-ifdef(TEST).
-export([
            connect/2,
            read_binary/2,
            write_binary/3
        ]).
-define (FILETEST, "filetest").
-endif.

-export([
            read_from_gfs/2,
            save_to_gfs/3
        ]).

-include_lib("dar_model/src/dar_model.hrl").
-include_lib("erlmongo/src/erlmongo.hrl").

read_from_gfs(Name,DB) ->
    {ok,B} = read_binary(Name,DB),
    {ok,B,Name}.

save_to_gfs(Binary,Meta,DB) ->
    {ok, Name} = validate_meta(Meta),
    {ok,N} = write_binary(Binary, Name,DB),
    {ok,N}.

validate_meta(M) ->
    ok = dar_model:validate_meta(M),
    #{name := Name} = M,
    {ok,Name}.

write_binary(B,N,DB) ->
    mongodb:singleServer(def),
    mongodb:connect(def),
    Mong = mongoapi:new(def,list_to_binary(DB)),
    Mong:gfsIndexes(),
    PID = Mong:gfsNew(N),
    Mong:gfsWrite(PID,B),
    Mong:gfsClose(PID),
    {ok,N}.

read_binary(Name,DB) ->
    mongodb:singleServer(def),
    mongodb:connect(def),
    Mong = mongoapi:new(def,list_to_binary(DB)),
    Mong:gfsIndexes(),
    PID = Mong:gfsOpen(#gfs_file{filename = Name}),
    B = Mong:gfsRead(PID,100000),
    Mong:gfsClose(PID),
    {ok,B}.

-ifdef(TEST).
connect(_,serverconnect) ->
    mongodb:singleServer(def),
    C = mongodb:connect(def),
    {C};
connect(DB,gfsconnect) ->
    mongodb:singleServer(def),
    mongodb:connect(def),
    Mong = mongoapi:new(def,list_to_binary(DB)),
    Mong:gfsIndexes(),
    PID = Mong:gfsOpen(#gfs_file{filename = ?FILETEST}),
    B = Mong:gfsRead(PID,100000),
    Mong:gfsClose(PID),
    {ok,B}.
-endif.
