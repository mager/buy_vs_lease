defmodule BuyVsLeaseWeb.Router do
  use BuyVsLeaseWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BuyVsLeaseWeb do
    pipe_through :api

    resources "/vehicles", VehicleController
    get "/search", VehicleController, :search
    get "/years", VehicleController, :search_years
    get "/makes", VehicleController, :search_makes
  end
end
