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
            state:        DARState.requestreceived,
            actions:      [DARState.retrievingdata],
            images:       %DARModelImageProcessing{}
            use ExConstructor

  def get_json m do
    Poison.encode! m
  end

  # @behaviour Access

end
