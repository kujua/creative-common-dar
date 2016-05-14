-module(dar_model).

-include("dar_model.hrl").

%% API exports
-export([
          validate_asset_meta/1,
          assetmetadata_empty/0,
          assetmetadata/4,
          storymodel_empty/0,
          storymodel/3,
          validate_story_meta/1,
          imageprocessingmodel_empty/0,
          imageprocessingmodel/3,
          validate_imageprocessing/1
        ]).

assetmetadata_empty() ->
  #{name => "", origin=>"",timestamp=>0, gfsid=> ""}.

assetmetadata(Name,Origin,Timestamp,GfsId) ->
  #{name => Name, origin=>Origin, timestamp=>Timestamp, gfsid=>GfsId}.

validate_asset_meta(M) ->
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

storymodel_empty() ->
  #{title => "", text=>[], illustrations=>[],timestamp_creation=>0, meta=> {}, stid =>0}.

storymodel(Title,Created,Meta) ->
  #{title => Title, text=>[], illustrations=>[],timestamp_creation=>Created, meta=>Meta, stid =>0}.

validate_story_meta(M) ->
  #{title := PTitle} = M,
  #{timestamp_creation := PTimestamp} = M,
  #{stid := PStid} = M,
  P = {PTitle,PTimestamp,PStid},
  case P of
    {PTitle,_,_} when PTitle == [] -> false;
    {_,PTimestamp,_} when PTimestamp == 0 -> false;
    {_,_,PStid} when PStid == 0 -> false;
    _ -> ok
  end.

  imageprocessingmodel_empty() ->
    #{process=>undefined, imagelist=>[], options=>{}}.

  imageprocessingmodel(Proc,Imagelist,Options) ->
    #{process=>Proc, imagelist=>Imagelist, options=>Options}.

  validate_imageprocessing(Model) ->
    ok.

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
