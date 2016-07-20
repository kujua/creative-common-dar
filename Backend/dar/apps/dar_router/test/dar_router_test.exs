defmodule DARRouterTest do
  use ExUnit.Case

  setup do
    {:ok, router} = DARRouter.start_link TestDARRouter
    {:ok, router: router}
  end

  test "direct call success", %{router: router} do
    assert router != nil
    assert {:response, "TestMessage"} = GenServer.call(router, {:msg, "TestMessage"})
  end

  test "process_message success", %{router: router}  do
    assert router != nil
    assert {:response, {:request, "TestMessage"}} = DARRouter.process_message router, {:request, "TestMessage"}
  end

  test "process_message failure", %{router: router}  do
    assert router != nil
    assert {:failure, {}} = DARRouter.process_message router, {}
  end

end
