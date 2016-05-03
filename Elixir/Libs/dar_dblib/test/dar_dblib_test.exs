defmodule ExUnitContext do
    use ExUnit.Case, async: true

    setup_all context do
        IO.puts "Setup All:"
        Enum.each context, &IO.puts(inspect &1)
        {:ok, [arg1: "setupallarg0", arg2: fn x -> x*x end]}
    end

    setup context do
        IO.puts ""
        IO.puts "Setup:"
        Enum.each context, &IO.puts(inspect &1)
        on_exit fn ->
            IO.puts ""
            IO.puts "on exit"
        end
        {:ok, [setuparg: "setuparg1"]}
    end

    test "assert", context do
        assert 2 + 2 == context.arg2.(2)
    end

    test "refute", context do
        IO.puts "test:"
        Enum.each context, &IO.puts(inspect &1)
        refute 2 + 2 == context.arg2.(1)
    end

    test "dar_model_assetmetadata_empty_mocked_test" do
        :ok = :meck.new :dar_model
        :meck.expect :dar_model, :assetmetadata_empty, fn -> :changed end
        assert :meck.validate :dar_model
        assert :dar_model.assetmetadata_empty == :changed
        :ok = :meck.unload :dar_model
    end
end
