defmodule DARState do
  @idle :idle
  @requestreceived :requestreceived
  @requestvalidated :requestvalidated
  @retrievingdata :retrievingdata
  @processingimage :processingimage
  @creatingdocument :creatingdocument
  @requestprocessed :requestprocessed
  @responsedelivered :responsedelivered

  def idle do
    @idle
  end

  def requestreceived do
    @requestreceived
  end

  def requestvalidated do
    @requestvalidated
  end

  def retrievingdata do
    @retrievingdata
  end

  def processingimage do
    @processingimage
  end

  def creatingdocument do
    @creatingdocument
  end

  def requestprocessed do
    @requestprocessed
  end

  def responsedelivered do
    @responsedelivered
  end
end

defmodule DARModelExternalMessage do
  @doc """
  This model is used in communication between clients and backend.
  """
  @derive [Poison.Encoder]
  defstruct gfsid:        "",
            name:         "",
            comment:      "",
            actions:      []
            use ExConstructor

  def from_json m do
    Poison.decode! m
  end
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
            state:        DARState.requestreceived,
            actions:      [DARState.retrievingdata]
            use ExConstructor

  def get_json m do
    Poison.encode! m
  end
end

# imageprocessingmodel_empty() ->
#   #{process=>undefined, imagelist=>[], options=>{}}.
#
# imageprocessingmodel(Proc,Imagelist,Options) ->
#   #{process=>Proc, imagelist=>Imagelist, options=>Options}.
#
# validate_imageprocessing(Model) ->
#   ok.
