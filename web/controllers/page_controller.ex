defmodule LiveGuides.PageController do
  use LiveGuides.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, params) do
    cond do
      params["directory"] ->
        guide = render_file(params["directory"], params["pagename"])
      !params["directory"] ->
        guide = render_file(params["pagename"])
    end
    render conn, "show.html", guide: guide,
                              name: params["pagename"]
  end

  def render_file(dir, page) do
    File.read!("phoenix_guides/#{dir}/#{page}")
    |> Earmark.to_html
  end

  def render_file(page) do
    File.read!("phoenix_guides/#{page}")
    |> Earmark.to_html
  end
end
