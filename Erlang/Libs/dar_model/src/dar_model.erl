-module(dar_model).

-include("dar_model.hrl").

%% API exports
-export([
            validate_meta/1,
            assetmetadata_empty/0,
            assetmetadata/4
        ]).

assetmetadata_empty() ->
    #{name => "", origin=>"",timestamp=>0, gfsid=> ""}.

assetmetadata(Name,Origin,Timestamp,GfsId) ->
    #{name => Name, origin=>Origin, timestamp=>Timestamp, gfsid=>GfsId}.

validate_meta(M) ->
    #{name := PName} = M,
    #{gfsid := PGfsid} = M,
    #{timestamp := PTimestamp} = M,
    P = {PName,PGfsid,PTimestamp},
    case P of
        {PName,_,_} when PName == [] -> false;
        {_,PGfsid,_} when PGfsid == [] -> false;
        {_,_,PTimestamp} when PTimestamp == 0 -> false;
        _ -> ok
    end.

%%%-------------------------------------------------------------------
%%% mymap() ->
%%%    #{key1 => 1, key2 => 2}.
%%%
%%% mymap2() ->
%%%    #{key1 => 99, key2 => 2}.
%%%
%%% validate1(#documentrecord{name = Name}) ->
%%%    case Name of
%%%        "test" -> 42;
%%%        _ -> 0
%%%    end.
%%%
%%% validate2(M) ->
%%%    #{key1 := V1} = M,
%%%    #{key2 := V2} = M,
%%%    case V1 of
%%%        1 -> V2;
%%%        _ -> -99
%%%    end.
%%%-------------------------------------------------------------------
