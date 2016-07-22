defmodule DARWorkflow do
  use Supervisor

  def process_message do
    "Message from Workflow: "
      <> DARImageLib.process_message
      <> ", "
      <> DARPdfLib.process_message
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
