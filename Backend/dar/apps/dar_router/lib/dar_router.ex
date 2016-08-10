defmodule DARRouter do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def process_message(server, msg) do
    case msg do
      {:get_assets_all, params} ->
        GenServer.call(server, {:msg, msg})
      {:request, _} ->
        GenServer.call(server, {:msg, msg})
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
    # ret = DARWorkflow.process_message %DARModelInternalMessage{
    #   :metaid => "6a75e636-3e9d-41e7-9462-88980926a832",
    #   :name => "testname",
    #   :actions => [DARState.processingimage, DARState.creatingdocument]
    # }
# xmsg = %DARModelExternalMessage {:metaid => "6a75e636-3e9d-41e7-9462-88980926a832",:gfsid => "",:name => "testexternal",:comment => "external comment",:actions => [DARAction.retrievedoclist_all, DARAction.retrieveimage]}
# m = DARModelInternalMessage.from_external_message xmsg
    {action, params} = msg
    case action do
      :get_assets_all ->
        xmsg = %{
          :name => "",
          :actions => [DARAction.retrievedoclist_all],
          :actionfilter => params,
          :comment => "",
          :metaid => "",
          :gfsid => ""
        }
        ret = DARWorkflow.process_message (DARModelInternalMessage.from_external_message xmsg)
        {:reply, {:response, {:request, ret}}, state}
    end

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
