defmodule BuyVsLeaseWeb.Router do
  use BuyVsLeaseWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BuyVsLeaseWeb do
    pipe_through :api

    resources "/vehicles", VehicleController
    get "/search", VehicleController, :search
    get "/years", VehicleController, :fetch_years
    get "/makes", VehicleController, :fetch_makes
    get "/models", VehicleController, :fetch_models

    resources "/analysis", AnalysisController
  end
end
