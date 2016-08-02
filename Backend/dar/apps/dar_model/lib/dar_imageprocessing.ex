defmodule DARModelImageProcessing do
  # imageprocessingmodel_empty() ->
  #   #{process=>undefined, imagelist=>[], options=>{}}.
  #
  # imageprocessingmodel(Proc,Imagelist,Options) ->
  #   #{process=>Proc, imagelist=>Imagelist, options=>Options}.
  #
  # validate_imageprocessing(Model) ->
  #   ok.
  defstruct name:         "",
            comment:      "",
            imagelist:    [],
            options:      []
end
