defmodule LiveGuides.PageController do
  use LiveGuides.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
