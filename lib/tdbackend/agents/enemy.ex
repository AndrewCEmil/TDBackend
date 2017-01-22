defmodule TDBackend.Agents.Enemy do
  
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  def set_hp(enemy, hp) do
    put(enemy, "hp", hp)
    put(enemy, "health", hp)
  end

  def get_hp(enemy) do
    get(enemy, "hp")
  end

  def get_health(enemy) do
    get(enemy, "health")
  end

  def set_health(enemy, health) do
    put(enemy, "health", health)
  end

  def damage(enemy, damage) do
    health = get_health(enemy)
    set_health(enemy, health - damage)
  end

  defp get(enemy, key) do
    Agent.get(enemy, &Map.get(&1, key))
  end

  defp put(enemy, key, value) do
    Agent.update(enemy, &Map.put(&1, key, value))
  end
end
