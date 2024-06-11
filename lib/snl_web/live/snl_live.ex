defmodule SnlWeb.SnlLive do
  use SnlWeb, :live_view

  alias Snl.Game.Play

  def mount(_params, _session, socket) do
  	new_socket =
  	socket
  	|> assign(die: 0)
  	|> assign(rand: Play.random_color())

  	{:ok, new_socket}
  end

  def handle_event("roll", map, socket) do
  	die_roll = Play.roll_die()

  	new_socket =
  	socket
  	|> assign(die: die_roll)

  	{:reply, map, new_socket}
  end
end