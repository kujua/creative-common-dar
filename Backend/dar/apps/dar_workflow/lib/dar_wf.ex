defmodule DARWf do
  use GenStateMachine

  # Client

  def start_link do
    GenStateMachine.start_link(DARWf, {:off, 5}, name: DARWf)
  end

  def terminate do
      GenStateMachine.stop(DARWf, :normal)
  end

  def flip do
    GenStateMachine.cast(DARWf, :flip)
  end

  def get_count do
    GenStateMachine.call(DARWf, :get_count)
  end

  # Server (callbacks)

  def handle_event(:cast, :flip, :off, data) do
    {:next_state, :on, data + 1}
  end

  def handle_event(:cast, :flip, :on, data) do
    {:next_state, :off, data}
  end

  def handle_event({:call, from}, :get_count, state, data) do
    DARPdfLib.process_message
    {:next_state, state, data, [{:reply, from, data}]}
  end

  def handle_event(event_type, event_content, state, data) do
    # Call the default implementation from GenStateMachine
    super(event_type, event_content, state, data)
  end
end
