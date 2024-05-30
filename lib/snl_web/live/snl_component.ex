defmodule SnlComponent do

  use Phoenix.LiveComponent

  def render(assigns) do
    IO.inspect assigns
    ~H"""
    <img class="absolute"  id="1" src="priv/static/images/red-pin.png" width="220" />
    """
  end
end