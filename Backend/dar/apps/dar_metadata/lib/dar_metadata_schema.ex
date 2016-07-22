defmodule MetaData do
  use Ecto.Schema
  # import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "metadata" do
    field :name,       :string
    field :comment,    :string
  end

  def changeset(meta,params \\ :empty) do
      meta
  end
end
