defmodule LiveGuides.PageController do
  use LiveGuides.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, params) do
    render conn, "show.html", guide: render_file(params["pagename"]), name: params["pagename"]
  end

  def render_file(page) do
    File.read!("phoenix_guides/#{page}")
    |> Earmark.to_html
  end
end
