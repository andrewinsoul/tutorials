defmodule Tutorials.ListImpl.SevenWonders do
  defstruct name: "", country: ""

  alias Tutorials.ListImpl.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  def list_all() do
    [
      %SevenWonders{
        name: "Taj Mahal",
        country: "India"
      },
      %SevenWonders{
        name: "Chichen Itza",
        country: "Mexico"
      },
      %SevenWonders{
        name: "Petra",
        country: "Jordan"
      },
      %SevenWonders{
        name: "Machu Picchu",
        country: "Peru"
      },
      %SevenWonders{
        name: "Christ, the redeemer",
        country: "Brazil"
      },
      %SevenWonders{
        name: "Colosseum",
        country: "Italy"
      },
      %SevenWonders{
        name: "The Great wall of China",
        country: "China"
      }
    ]
  end

  def print_names() do
    SevenWonders.list_all |> Enum.each(fn %SevenWonders{name: name} -> IO.puts("Name: #{name}") end)
  end

  @spec filter_by_country(String.t()) :: [t()]
  def filter_by_country(country) do
    SevenWonders.list_all() |> Enum.filter(fn %SevenWonders{country: name} -> String.downcase(name) == String.downcase(country)  end)
  end

  @spec countries_starting_with_i() :: [t()]
  def countries_starting_with_i() do
    SevenWonders.list_all |> Enum.filter(fn %SevenWonders{country: name} -> String.starts_with?(name, "I")  end)
  end
end

alias Tutorials.ListImpl.SevenWonders
IO.inspect(SevenWonders.countries_starting_with_i)
