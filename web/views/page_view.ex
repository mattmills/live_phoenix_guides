defmodule LiveGuides.PageView do
  use LiveGuides.Web, :view

  def display_name(string) do
    String.replace(string, ".md", "")
    |> String.replace(~r/^.*_/, "")
    |> String.capitalize
  end
end
