defmodule TDBackend.RegistryTest do
  use ExUnit.Case, async: true

  test "creates and returns enemy" do
    {:ok, registry} = TDBackend.Registry.start_link(:registry)

    assert TDBackend.Registry.lookup(:registry, "enemy0") == :error
    TDBackend.Registry.create(:registry, "enemy0")
    assert {:ok, enemy} = TDBackend.Registry.lookup(:registry, "enemy0")
    TDBackend.Agents.Enemy.set_hp(enemy, 10)
    assert TDBackend.Agents.Enemy.get_health(enemy) == 10
  end
end
