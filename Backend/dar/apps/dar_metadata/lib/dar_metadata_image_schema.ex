defmodule MetaDataImage do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "metadataimage" do
    field :name,        :string
    field :metaid,      :string
    field :timestamp,   :integer
    field :gfsid,       :string
  end

  def changeset(meta, params \\ :empty) do
      meta
  end
end
