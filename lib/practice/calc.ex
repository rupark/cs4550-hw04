defmodule Practice.Calc do
  require Logger
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def factor(n, i, l) do
    if i <= n do
      if rem(n, i) == 0 do
        factor(n, i+1, [i | l])
      else
        factor(n, i+1, l)
      end
    else
      l
    end
  end

  def calc(expr) do

    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    # expr
    # |> String.split(~r/\s+/)
    # |> hd
    # |> parse_float
    # |> :math.sqrt()

    m = "+"

    expr
    |> String.split()
    |> Enum.map_every(2, fn(x) -> Float.parse(x) |> elem(0) end)
    |> Enum.reduce(0.0, fn(x, acc) ->
      if acc == 0.0 do
        x
      else
        if x != "+" and x != "-" and x != "/" and x != "*" do
          if m == "+" do
            acc + x
          else
            if m == "-" do
              acc - x
            else
              if m == "/" do
                acc / x
              else
                if m == "*" do
                  acc * x
                end
              end
            end
          end
        else
          m = x
          acc
        end
      end end)
    end
  end
