-module(dar_model).

-include("dar_model.hrl").

%% API exports
-export([
            validate_meta/1,
            assetmetadata_empty/0,
            assetmetadata/3,
            mymap/0,mymap2/0,validate1/1,validate2/1
        ]).

assetmetadata_empty() ->
    #{name => "", origin=>"",timestamp=>0}.

assetmetadata(Name,Origin,Timestamp) ->
    #{name => Name, origin=>Origin, timestamp=>Timestamp}.

validate_meta(M) ->
    #{name := PName} = M,
    #{origin := POrigin} = M,
    #{timestamp := PTimestamp} = M,
    P = {PName,POrigin,PTimestamp},
    case P of
        {PName,_,_} when PName == [] -> false;
        {_,POrigin,_} when POrigin == [] -> false;
        {_,_,PTimestamp} when PTimestamp == 0 -> false;
        _ -> ok
    end.

mymap() ->
    #{key1 => 1, key2 => 2}.

mymap2() ->
    #{key1 => 99, key2 => 2}.

validate1(#documentrecord{name = Name}) ->
    case Name of
        "test" -> 42;
        _ -> 0
    end.

validate2(M) ->
    #{key1 := V1} = M,
    #{key2 := V2} = M,
    case V1 of
        1 -> V2;
        _ -> -99
    end.
