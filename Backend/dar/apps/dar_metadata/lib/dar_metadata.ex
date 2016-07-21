defmodule DARMetaData do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  # def process_message(server, msg) do
  #   case msg do
  #     {:request, _} -> GenServer.call(server, {:msg, msg})
  #     _ -> {:failure, msg}
  #   end
  #
  # end
  #
  # def create(server, name) do
  #   GenServer.cast(server, {:create, name})
  # end

  def init(:ok) do
    {:ok, ""}
  end

  # def handle_call({}, _from, state) do
  #   # {:reply, Map.fetch(names, name), names}
  #   {:noreply, state}
  # end
  def handle_call({:msg, msg}, _from, state) do
    {:reply, "", state}
  end
end
