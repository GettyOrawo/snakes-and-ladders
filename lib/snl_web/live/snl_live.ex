defmodule SnlWeb.SnlLive do
  use SnlWeb, :live_view

  alias Snl.Game.Play

  def mount(_params, _session, socket) do
    {:ok, assign(socket, die: 0)}
  end

  def handle_event("roll", map, socket) do
    die_roll = Play.roll_die()

    {:reply, map, assign(socket, die: die_roll)}
  end
end
