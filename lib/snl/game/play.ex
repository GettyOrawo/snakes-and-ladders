defmodule Snl.Game.Play do
  def roll_die() do
    :rand.uniform(6)
  end
end
