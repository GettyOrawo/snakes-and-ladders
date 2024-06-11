defmodule Snl.Game.Play do
  
  def roll_die() do
  	:rand.uniform(6)
  end

  def random_color do
    for x <- board() do
      color = Enum.random(["blue-500", "pink-500", "cyan-500", "rose-400", "yellow-400", "pink-500", "green-500"])
      {x, "bg-" <> color}
    end
  end

  defp board() do
    1..100
    |> Enum.reverse()
    |> Enum.chunk_every(10)
    |> Enum.flat_map(fn x -> 
      if hd(x) in [10,30,50,70,90] do 
        Enum.reverse(x) 
      else 
        x 
      end  
    end)
  end
end