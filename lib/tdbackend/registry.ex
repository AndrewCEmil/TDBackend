defmodule TDBackend.Registry do
  use GenServer

  def start_link(server_name) do 
    GenServer.start_link(__MODULE__, :ok, name: server_name)
  end

  def lookup(server_name, name) do
    GenServer.call(server_name, {:lookup, name})
  end

  def create(server_name, name) do
    GenServer.cast(server_name, {:create, name})
  end

  ##Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, enemy} = TDBackend.Agents.Enemy.start_link
      {:noreply, Map.put(names, name, enemy)}
    end
  end
end
