defmodule DarImagelibTest do
  use ExUnit.Case

  @fileliststring "/Users/Wolfgang/Projects/creative-common-dar/Elixir/Libs/dar_imagelib/test/res/kujua_icon.gif /Users/Wolfgang/Projects/creative-common-dar/Elixir/Libs/dar_imagelib/test/res/2-0007.jpg /Users/Wolfgang/Projects/creative-common-dar/Elixir/Libs/dar_imagelib/test/res/output_from_test.jpg "
  @optionliststring "-dissolve 25% -gravity northwest "
  @createdfile "/Users/Wolfgang/Projects/creative-common-dar/Elixir/Libs/dar_imagelib/test/res/output_from_test.jpg"

  setup_all do
    :ok = File.rm @createdfile
  end

  setup _context do
    {:ok, [ipm: :dar_model.imageprocessingmodel(:watermark,["kujua_icon.gif","2-0007.jpg","output_from_test.jpg"], [ "-dissolve", "25%", "-gravity northwest" ])]}
  end

  test "getimagelist_from_model", context do
    # Enum.each context, &IO.puts(inspect &1)
    l = DarImagelib.getimagelist_as_string(context.ipm.imagelist)
    refute l == ""
    assert l == @fileliststring
  end

  test "getoptionlist_as_string", context do
    # Enum.each context, &IO.puts(inspect &1)
    l = DarImagelib.getlist_as_string(context.ipm.options)
    refute l == ""
    assert l == @optionliststring
  end

  test "watermark", context do
    # Enum.each context, &IO.puts(inspect &1)
    DarImagelib.watermark context.ipm
    assert File.exists? @createdfile
  end
end
