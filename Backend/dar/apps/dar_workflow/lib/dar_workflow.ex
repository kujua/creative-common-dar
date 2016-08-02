defmodule DARWorkflow do
  use Supervisor

  def process_message(m) do
    case m.state do

      :requestreceived ->
        DARWf.start_link m
        DARWf.new_request

      :requestvalidated ->
        DARWf.retrieve_data

      :retrievingdata ->
        :ok

      :processingimage ->
        :ok

      :creatingdocument ->
        :ok

      :requestprocessed ->
        DARWf.terminate
        DARModelInternalMessage.get_json m
    end

  end

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: {:global, __MODULE__})
  end

  def init(_opts) do
    children = [
      worker(DARImageLib,[DARImageLib]),
      worker(DARPdfLib,[DARPdfLib])
    ]
    supervise children, strategy: :one_for_one
  end
end
