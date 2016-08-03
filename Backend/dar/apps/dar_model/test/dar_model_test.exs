defmodule DARModelTest do
  use ExUnit.Case
  import ExConstructor

  test "handles DARModelExternalMessage from map" do
    map =  %{
              "gfsid" => "a",
              :name => "b",
              "comment" => "c"
            }
    # IO.puts(inspect map)
    msg = %DARModelExternalMessage{
                gfsid: "a",
                name: "b",
                comment: "c"
             }
    # IO.puts(inspect msg)
    assert(msg == populate_struct(%DARModelExternalMessage{}, map, []))
  end

  test "handles DARModelExternalMessage from JSON" do
    msg = %DARModelExternalMessage{
                gfsid: "d",
                name: "e",
                comment: "f"
             }
    tojson = Poison.encode!(msg)
    # IO.puts(inspect tojson)
    fromjson = Poison.decode!(tojson, as: %DARModelExternalMessage{})
    # IO.puts(inspect fromjson)
    assert(fromjson == populate_struct(%DARModelExternalMessage{}, fromjson, []))
  end

  test "handles DARModelInternalMessage from map" do
    map =  %{
              "gfsid" => "g",
              :name => "h",
              "comment" => "i",
              :state => DARState.requestreceived
            }
    # IO.puts(inspect map)
    msg = %DARModelInternalMessage{
                gfsid: "g",
                name: "h",
                comment: "i"
             }
    # IO.puts(inspect msg)
    assert(msg == populate_struct(%DARModelInternalMessage{}, map, []))
  end

  test "handles DARModelInternalMessage from JSON" do
    msg = %DARModelInternalMessage{
                gfsid: "j",
                name: "k",
                comment: "l",
                has_pdf: true,
                state: DARState.requestreceived
             }
    tojson = Poison.encode!(msg)
    # IO.puts(inspect tojson)
    fromjson = Poison.decode!(tojson, as: %DARModelInternalMessage{})
    # IO.puts(inspect fromjson)
    assert(fromjson == populate_struct(%DARModelInternalMessage{}, fromjson, []))
  end

  test "handles DARModelInternalMessage from DARModelExternalMessage" do
    mex = %DARModelExternalMessage {
      :gfsid => "j",
      :name => "k",
      :comment => "l",
      :actions => ["imageprocessing"]
    }
    # IO.puts(inspect mex)
    mint = DARModelInternalMessage.from_external_message mex
    # IO.puts(inspect mint)
    assert(mint.name == mex.name)
    assert(mint.gfsid == mex.gfsid)
    assert(mint.comment == mex.comment)
    assert(mint.actions == mex.actions)
  end
end
