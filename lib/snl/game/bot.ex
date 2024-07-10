defmodule Snl.Bot do
  use GenServer
  alias Snl.Game.Play
  alias Phoenix.PubSub

  def start_link(_) do
    times_played = 0
    GenServer.start_link(__MODULE__, times_played, name: __MODULE__)
  end

  # i need to maintain the state
  def bot_roll_die(pid) do
    GenServer.cast(pid, :bot_roll_die)
  end

  # server
  def init(times_played) do
    {:ok, times_played}
  end

  def handle_cast(:bot_roll_die, times_played) do
    roll_state = Play.roll_die()
    PubSub.broadcast(Snl.PubSub, "playing", {:bot_roll, roll_state})
    {:noreply, times_played + 1}
  end
end
