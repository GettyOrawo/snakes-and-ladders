defmodule SnlWeb.SnlLive do
  use SnlWeb, :live_view

  alias Snl.Game.Play

  def mount(_params, _session, socket) do
  	{:ok, assign(socket, die: Play.roll_die())}
  end

  def handle_event("roll", map, socket) do
  	{:reply, map, assign(socket, die: Play.roll_die())}
  end
end