defmodule DARWf do
  use GenStateMachine

  # Client

  def start_link(m) do
    GenStateMachine.start_link(DARWf, {DARState.idle, m}, name: DARWf)
  end

  def terminate do
      GenStateMachine.stop(DARWf, :normal)
  end

  def new_request do
    r = GenStateMachine.call(DARWf, DARState.requestreceived)
    DARWorkflow.process_message r
  end

  def retrieve_data do
    r = GenStateMachine.call(DARWf, DARState.retrievingdata)
    DARWorkflow.process_message r
  end

  # Server (callbacks)

  def handle_event({:call, from}, :requestreceived, state, msg) do
    case DARWorkflowOperations.validate_request msg do
      :ok ->
        {:next_state, DARState.requestvalidated,
            %{msg | :state => DARState.requestvalidated},
            {:reply, from, %{msg | :state => DARState.requestvalidated}}}
      _ ->
        {:next_state, state, msg, {:reply, from, msg}}
    end
  end

  def handle_event({:call, from}, :retrievingdata, state, msg) do
    case DARWorkflowOperations.retrieve_data msg do
      :ok ->
        {:next_state, DARState.requestprocessed,
            %{msg | :state => DARState.requestprocessed},
            {:reply, from, %{msg | :state => DARState.requestprocessed}}}
      _ ->
        {:next_state, state, msg, {:reply, from, msg}}
    end
  end

  def handle_event({:call, from}, :get_message, state, msg) do
    msg
  end

  def handle_event(event_type, event_content, state, data) do
    # Call the default implementation from GenStateMachine
    super(event_type, event_content, state, data)
  end
end
