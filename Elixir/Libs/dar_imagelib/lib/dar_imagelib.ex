defmodule DarImagelib.App do
  use Application

  def start(_type, _args) do
    tree = []

    opts = [name: DarDblib.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end
end

defmodule DarImagelib do

  defmacro path_resource(file) do
    Path.join(DarImagelib.Mixfile.getconstant(:respath),file)
  end

  def resize do
      Mogrify.open(path_resource("bender.jpg"))
          |> Mogrify.copy
          |> Mogrify.resize("250x250")
          |> Mogrify.save(path_resource("imagelib_resize.jpg"))
  end

  def watermark(imageprocessingmodel) do
      # filelist = getimagelist_from_model_as_string(imageprocessingmodel.imagelist)
      # options = getoptionlist_as_string(imageprocessingmodel.options)
      Mogrify.watermark(
        getimagelist_as_string(imageprocessingmodel.imagelist),
        getlist_as_string(imageprocessingmodel.options))

  end

  def getimagelist_as_string(imagelist) do
    {_,s} = Enum.map_reduce (for n <- imagelist, do: n <> " "),[], fn(name,acc) -> {name,List.insert_at(acc,-1,add_path(name))} end
    List.to_string(s)
  end

  def getlist_as_string(list) do
    for n <- list, into:  "", do: n <> " "
  end

  defp add_path(filename) do
    Path.join(DarImagelib.Mixfile.getconstant(:respath),filename)
  end
end
