-module(darapi_handler_testpage).

-compile([{parse_transform, lager_transform}]).
-compile(export_all).

-record(state, {
    testmode :: get_apiassets | post_apiassets
}).

init(_Type, Req, Opts) ->
  {_, Testmode} = lists:keyfind(testmode, 1, Opts),
  {ok, Req, #state{testmode=Testmode}}.

handle(Req, State=#state{testmode=Testmode}) ->
  lager:info("handle state testmode: ~p~n", [lager:pr(Testmode, ?MODULE)]),
  {Tqs, _} = cowboy_req:qs_val(<<"testmode">>, Req),
  lager:info("handle qs testmode: ~p~n", [lager:pr(Tqs, ?MODULE)]),
  {AllValues, _} = cowboy_req:qs_vals(Req),
  lager:info("handle all qs: ~p~n", [lager:pr(AllValues, ?MODULE)]),
  Body =
    case Tqs of
      undefined -> test_response(Testmode);
      <<>> -> test_response(Testmode);
      _ -> test_response(list_to_atom(binary_to_list(Tqs)))
    end,
  Headers = [{<<"content-type">>, <<"text/html">>}],
  {ok, Reply} = cowboy_req:reply(200, Headers, Body, Req),
  {ok, Reply, State}.

terminate(_Reason, _Req, _State) ->
  ok.
% content_types_provided(Req, State) ->
% 	{[
% 		{<<"text/html">>, test_response}
% 	], Req, State}.

test_response(Testmode) ->
  lager:info("test_response testmode: ~p~n", [lager:pr(Testmode, ?MODULE)]),
  case Testmode of
    get_apiassets ->
      {ok, B} = testpage_dtl:render([{test, "get assets"}]),
      B;
    post_apiassets ->
      {ok, B} = testpage_dtl:render([{test, "post assets"}]),
      B;
    _ ->
      {ok, B} = testpage_dtl:render([{test, "no mode defined"}]),
      B
    end.

  % {_, Test} = lists:keyfind(test, 1, Opts),
  % lager:info("test_response state: ~p~n", [lager:pr(Test, ?MODULE)]),
  % {Tqs, _} = cowboy_req:qs_val(<<"testqs">>, Req),
  % lager:info("test_response Opts: ~p~n", [lager:pr(Tqs, ?MODULE)]),

  % "<html>
  %             <head>
  %             	<meta charset=\"utf-8\">
  %             	<title>DAR Testpage</title>
  %             </head>
  %             <body>
  %             	<p>"
  %               ++
  %               io_lib:format("~p", [Test])
  %               ++
  %             "</p>
  %             </body>
  %            </html>".

  % cowboy_req:reply(
  %     200,
  %     [
	% 	    {
  %         <<"content-type">>,
  %         <<"text/html">>
  %       }
	%     ],
  %     B,
  %     Req).
