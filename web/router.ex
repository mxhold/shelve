defmodule Shelve.Router do
  use Shelve.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Shelve do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Shelve.API do
    pipe_through :api

    get "/posts", PostController, :index
    post "/posts", PostController, :create
    get "/posts/:id", PostController, :show
    patch "/posts/:id", PostController, :update
    delete "/posts/:id", PostController, :delete
  end
end
