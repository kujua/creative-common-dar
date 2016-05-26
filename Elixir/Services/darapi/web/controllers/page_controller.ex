defmodule Darapi.PageController do
  use Darapi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
