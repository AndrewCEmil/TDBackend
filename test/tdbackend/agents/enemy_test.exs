defmodule TDBackend.Agents.EnemyTest do
  use ExUnit.Case, async: true

  test "sets health and hp" do
    {:ok, enemy} = TDBackend.Agents.Enemy.start_link
    TDBackend.Agents.Enemy.set_hp(enemy, 10)
    assert TDBackend.Agents.Enemy.get_hp(enemy) == 10
    
    TDBackend.Agents.Enemy.damage(enemy, 5)
    assert TDBackend.Agents.Enemy.get_health(enemy) == 5
  end
end
