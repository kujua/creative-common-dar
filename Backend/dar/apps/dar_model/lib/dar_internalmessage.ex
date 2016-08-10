defmodule DARModelInternalMessage do
  @doc """
  This model is used in communication between backend modules.
  Possible states:
    :requestreceived
    :
  """
  @derive [Poison.Encoder]
  defstruct gfsid:        "",
            metaid:       "",
            name:         "",
            comment:      "",
            has_pdf:      false,
            state:        DARState.requestreceived,
            actions:      [],
            actiongroups: [],
            images:       [],
            metastruct:   %DARModelMetaData{},
            actionfilter: []
            use ExConstructor

  def get_json m do
    Poison.encode! m
  end

  def from_external_message m do
    %DARModelInternalMessage{
      :metaid => m.metaid,
      :name => m.name,
      :comment => m.comment,
      :gfsid => m.gfsid,
      :actions => m.actions,
      :actionfilter => m.actionfilter
    }
  end
  # @behaviour Access

end
