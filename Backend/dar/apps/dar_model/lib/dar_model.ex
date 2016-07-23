defmodule DARState do
  @requestreceived :requestreceived

  def requestreceived do
    @requestreceived
  end
end

defmodule DARModelExternalMessage do
  @doc """
  This model is used in communication between clients and backend.
  """
  @derive [Poison.Encoder]
  defstruct gfsid:        "",
            name:         "",
            comment:      ""
            use ExConstructor
end

defmodule DARModelInternalMessage do
  @doc """
  This model is used in communication between backend modules.
  Possible states:
    :requestreceived
    :
  """
  @derive [Poison.Encoder]
  defstruct gfsid:        "",
            name:         "",
            comment:      "",
            has_pdf:      false,
            state:        DARState.requestreceived
            use ExConstructor
end
