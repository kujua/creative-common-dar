defmodule DarApi.ApiControllerTest do
  use DarApi.ConnCase, async: false

  test "GET /", %{conn: conn} do
    expected = %DARModelResponseMessage{

    }
    response = conn(:get, "/api/assets") |> send_request
    assert response.status == 200
    assert response.resp_body == DARModelResponseMessage.to_json expected
  end
end
