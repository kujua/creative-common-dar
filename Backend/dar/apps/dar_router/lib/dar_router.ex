defmodule DARRouter do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def process_message(server, msg) do
    case msg do
      {:request, _} -> GenServer.call(server, {:msg, msg})
      _ -> {:failure, msg}
    end

  end
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
    ret = DARWorkflow.process_message <> ", " <> DARDataStore.process_message
    {:reply, {:response, {:request, ret}}, state}
  end

  # def handle_cast({}, state) do
  #   # if Map.has_key?(names, name) do
  #   #   {:noreply, names}
  #   # else
  #   #   {:ok, bucket} = KV.Bucket.start_link
  #   #   {:noreply, Map.put(names, name, bucket)}
  #   # end
  #   {:noreply, state}
  # end
end
