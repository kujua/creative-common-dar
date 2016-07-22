defmodule DARMetaData.Seeds do
  def import_data do
    meta = %MetaData{name: "TestName", comment: "TestComment"}
    DARMetaData.Repo.insert!(meta)
  end
end
