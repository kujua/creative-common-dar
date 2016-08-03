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
end
