defmodule DARDataStore do
  use Supervisor

  def process_message do
    " Message from DataStore: "
      <> DARMetaData.process_message
      <> ", "
      <> DARGfs.process_message
  end

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: {:global, __MODULE__})
  end

  def init(_opts) do
    children = [
      worker(DARMetaData, [DARMetaData]),
      worker(DARGfs, [DARGfs])
    ]

    supervise children, strategy: :one_for_one
  end
end
