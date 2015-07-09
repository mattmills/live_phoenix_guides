defmodule LiveGuides.LayoutView do
  use LiveGuides.Web, :view

  def display_name(string) do
    String.replace(string, ".md", "")
    |> String.replace(~r/^.*_/, "")
    |> String.capitalize
  end

  def file_list do
    File.ls("phoenix_guides")
    |> elem(1)
    |> Enum.reject(fn(x) -> !String.match?(x, ~r/^.*_.*\.md$/) end)
  end

  def title do
    "Guides"
  end
end
