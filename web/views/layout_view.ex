defmodule LiveGuides.LayoutView do
  use LiveGuides.Web, :view

  def display_name(string) do
    String.replace(string, ".md", "")
    |> String.replace(~r/_/, " ")
    |> String.replace(~r/^([A-Z]|[a-z]){0,2} \b/, "")
    |> String.capitalize
  end

  def dir_list do
    File.ls!("phoenix_guides")
    |> Enum.reject(fn(x) -> !File.dir?("phoenix_guides/#{x}") end)
    |> Enum.reject(fn(x) -> Enum.count(list_dir("phoenix_guides/#{x}")) < 1 end)
    |> Enum.reverse 
  end

  def list_dir(dir) do
    File.ls!(dir)
    |> Enum.reject(fn(x) -> !String.match?(x, ~r/^.*_.*\.md$/) end)
  end

  def title do
    "Guides"
  end
end
