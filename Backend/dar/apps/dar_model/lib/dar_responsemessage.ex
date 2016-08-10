defmodule DARModelResponseMessage do
  defstruct name:           "",
            haserror:       false,
            msg:            "",
            responseaction: "",
            result:         [],
            debug:          %DARModelInternalMessage{}

  def get_json m do
    msg = %DARModelResponseMessage{
      debug: m
    }
    Poison.encode! msg
  end

  def to_json m do
    Poison.encode! m
  end
end
