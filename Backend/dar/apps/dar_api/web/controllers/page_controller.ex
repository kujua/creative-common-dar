defmodule DarApi.PageController do
  use DarApi.Web, :controller

  def index(conn, _params) do
    {:response, {:request, msg}} = DARRouter.process_message(DARRouter, {:request, "Test Message"})
    render conn, "index.html", msg: msg
  end
end
