defmodule Snl.Game.Play do
  
  def roll_die() do
  	:rand.uniform(6)
  end

  def random_color do
    for x <- board() do
      {x, "bg-" <> Enum.random(["purple-500", "yellow-400", "blue-500", "cyan-500", "pink-500", "pink-500"])}
    end
  end

  def board() do
    1..100
    |> Enum.reverse()
    |> Enum.chunk_every(10)
    |> Enum.map(fn x -> 
      if hd(x) in [10,30,50,70,90] do 
        Enum.reverse(x) 
      else 
        x 
      end  
    end)
    |> List.flatten
  end
end