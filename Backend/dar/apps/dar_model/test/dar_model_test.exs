defmodule DARModelTest do
  use ExUnit.Case
  import ExConstructor
  
  test "handles maps with string-vs-atom, camel-vs-underscore, and literals" do
      map = %{"field_one" => "a", "fieldTwo" => "b", :field_three => "c",
              :fieldFour => "d", "Field_Six" => "f", "field_seven" => 7,
              :field_eight => 8}
      struct = %DARModelMessage{field_one: "a", field_two: "b", field_three: "c",
                           field_four: "d", field_five: 5, Field_Six: "f",
                           FieldSeven: 7, FieldEight: 8}
      assert(struct == populate_struct(%DARModelMessage{}, map, []))
    end
end
