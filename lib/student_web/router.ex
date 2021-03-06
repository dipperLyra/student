defmodule StudentWeb.Router do
  use StudentWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug :protect_from_forgery

  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StudentWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/student", StudentController, :index
    get "/student/1", StudentController, :show
    post "/student", StudentController, :new
    put "/student", StudentController, :update
    delete "/student", StudentController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", StudentWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: StudentWeb.Telemetry
    end
  end
end
