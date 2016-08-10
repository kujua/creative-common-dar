defmodule DARModelExternalMessage do
  @doc """
  This model is used in communication between clients and backend.
  """
  @derive [Poison.Encoder]
  defstruct metaid:       "",
            gfsid:        "",
            name:         "",
            comment:      "",
            actions:      [],
            actionfilter: []
            use ExConstructor

  def from_json m do
    Poison.decode! m
  end
end
