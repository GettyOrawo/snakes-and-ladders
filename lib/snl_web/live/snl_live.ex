defmodule SnlWeb.SnlLive do
  use SnlWeb, :live_view

  use GenServer
  alias Snl.Game.Play
  alias Snl.Bot

  def mount(_params, _session, socket) do
    Phoenix.PubSub.subscribe(Snl.PubSub, "playing")

    new_socket =
      socket
      |> assign(die: 0)
      |> assign(rand: Play.random_color())
      |> assign(human_turn_to_play: true)

    {:ok, new_socket}
  end

  def handle_event("roll", map, socket) do
    die_roll = Play.roll_die()
    Process.send_after(self(), :bot_roll, 3000)

    new_socket =
      socket
      |> assign(die: die_roll)
      |> assign(human_turn_to_play: false)

    {:reply, map, new_socket}
  end

  # The results of the bot roll should be returned after 3 seconds
  def handle_info(:bot_roll, socket) do
    GenServer.cast(Bot, :bot_roll_die)
    {:noreply, socket}
  end

  def handle_info({:bot_roll, rolls}, socket) do
    new_socket =
      case socket.assigns.human_turn_to_play do
        false ->
          socket
          |> assign(human_turn_to_play: true)
          |> assign(die: rolls)

        true ->
          socket
      end

    {:noreply, new_socket}
  end
end
