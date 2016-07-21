defmodule DARDataStore do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: {:global, __MODULE__})
  end

  def init(_opts) do
    children = [
      worker(DARMetaData,[DARMetaData])
    ]
    supervise children, strategy: :one_for_one
  end
end
