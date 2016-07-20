defmodule DarApi.PageController do
  use DarApi.Web, :controller

  def index(conn, _params) do
    DARRouter.process_message(DARRouter, "Test Message")
    render conn, "index.html"
  end
end
