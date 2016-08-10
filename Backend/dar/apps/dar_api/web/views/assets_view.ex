defmodule DarApi.ApiView do
  use DarApi.Web, :view

  def render("index.json", %{response: response}) do
    response
  end
end
