defmodule ShortnerWeb.Router do
  use ShortnerWeb, :router

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

  scope "/", ShortnerWeb do
    pipe_through :browser

    # get "/", PageController, :index
    # get "/urls", LinkController, :index
    get "/", UrlController, :index
    get "/:url", UrlController, :show
    post "/url", UrlController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShortnerWeb do
  #   pipe_through :api
  # end
end
