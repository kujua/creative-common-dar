defmodule DARMetaData.Seeds do

  def seed_metadata do
    t = Calendar.DateTime.now! ("Europe/Vienna")
    meta = %MetaData{
      name: "TestName2",
      origin: "Seeds",
      timestamp: t |> Calendar.DateTime.Format.js_ms,
      gfsid: "",
      haspdf: false
    }
    DARMetaData.Repo.insert!(meta)
  end

  def seed_metadataimage do
    t = Calendar.DateTime.now! ("Europe/Vienna")
    metaimage = %MetaDataImage{
      metaid: "6a75e636-3e9d-41e7-9462-88980926a832",
      name: "TestName",
      timestamp: t |> Calendar.DateTime.Format.js_ms,
      gfsid: ""
    }
    DARMetaData.Repo.insert!(metaimage)
  end

  def seed_metadataimage2 do
    t = Calendar.DateTime.now! ("Europe/Vienna")
    metaimage = %MetaDataImage{
      metaid: "f1464a62-ab79-41db-ae72-6676ac2b8135",
      name: "TestName",
      timestamp: t |> Calendar.DateTime.Format.js_ms,
      gfsid: ""
    }
    DARMetaData.Repo.insert!(metaimage)
  end
end
