#!/usr/bin/env escript

main(_) ->
  % OSVars = ["USER", "PASS"],
  OSVars = [],
  [check_is_set(Var) || Var <- OSVars].

check_is_set(Var) ->
  case os:getenv(Var) of
    false ->
      rebar_api:error("Missing var ~s", [Var]),
      halt(1);
    _ ->
      ok
  end.
