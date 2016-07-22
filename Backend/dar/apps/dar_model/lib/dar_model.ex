defmodule DARModelMessage do
  @doc """
  Models in this module are used in communication between clients and backend.
  Database models are defined in dar_metadata and dar_gfs
  """
  @derive [Poison.Encoder]
  defstruct field_one: 1,
              field_two: 2,
              field_three: 3,
              field_four: 4,
              field_five: 5,
              Field_Six: 6,
              FieldSeven: 7,
              FieldEight: 8
    use ExConstructor
end
