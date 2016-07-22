defmodule DarMetaData.DataAccess do
  import Ecto.Query

  def write_meta(meta) do
      metax = %MetaData{name: meta.name, comment: meta.comment}
      cs = MetaData.changeset metax
      case DARMetaData.Repo.insert!(cs) do
          meta ->
              {:ok, meta}
      end
  end

  def get_meta_all do
    query = from w in MetaData,
        #   where: w.prcp > 0.0 or is_nil(w.prcp),
         select: w
    DARMetaData.Repo.all(query)
  end
end
