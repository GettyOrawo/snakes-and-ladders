defmodule SnlWeb.SnlLive do
  use SnlWeb, :live_view

  alias Snl.Game.Play

  def mount(_params, _session, socket) do
  	new_socket =
  	socket
  	|> assign(die: 0)
  	|> assign(rand: Play.random_color())
  	|> assign(position: 0)
  	|> assign(previous_position: 0)

  	{:ok, new_socket}
  end

  def handle_event("roll", map, socket) do
  	die_roll = Play.roll_die()
  	current_pos = socket.assigns.position
  	next_pos = 
  	if (current_pos + die_roll) > 100 do
  		100
  	else
  		current_pos + die_roll
  	end

  	# JS.remove_class("sr-only", to: "#img-#{next_pos}") |> JS.add_class("sr-only", to: "#img-#{current_pos}")

  	# socket = push_event(socket, "js-remove_class", %{
    # to: "#img-#{next_pos}", 
    # attr: "sr-only"
  # })

  	new_socket =
  	socket
  	|> assign(die: die_roll)
    |> assign(position: next_pos)
    |> assign(previous_position: current_pos)
    |> push_event("js-remove_class", %{
	    to: "#img-#{next_pos}", 
	    attr: "sr-only"
	  })
    |> IO.inspect(label: "********************************")

  	{:reply, map, new_socket}
  end
end