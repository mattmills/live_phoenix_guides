defmodule LiveGuides.Router do
  use LiveGuides.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveGuides do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:pagename", PageController, :show
    get "/:directory/:pagename", PageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveGuides do
  #   pipe_through :api
  # end
end
