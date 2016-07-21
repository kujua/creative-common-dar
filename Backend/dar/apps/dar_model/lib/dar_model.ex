defmodule DARModelMessage do
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
