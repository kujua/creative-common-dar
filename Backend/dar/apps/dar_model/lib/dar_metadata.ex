defmodule DARModelMetaData do
  defstruct timestamp:  "",
            name:       "",
            origin:     "",
            gfsid:      [],
            haspdf:     false

  def from_schema s do
    %DARModelMetaData {
      :timestamp => s.timestamp,
      :name => s.name,
      :origin => s.origin,
      :gfsid => s.gfsid,
      :haspdf => s.haspdf,
    }
  end

  defp create_model s do
    %DARModelMetaData {
      :timestamp => s.timestamp,
      :name => s.name,
      :origin => s.origin,
      :gfsid => s.gfsid,
      :haspdf => s.haspdf,
    }
  end

  def from_schema_list l do
    Enum.map(
      l,
      &(create_model &1)
    )
  end
end
