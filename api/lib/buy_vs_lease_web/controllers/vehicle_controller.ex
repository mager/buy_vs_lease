defmodule BuyVsLeaseWeb.VehicleController do
  use BuyVsLeaseWeb, :controller

  import Ecto.Query, only: [from: 2]

  alias BuyVsLease.Data
  alias BuyVsLease.Data.Vehicle

  action_fallback BuyVsLeaseWeb.FallbackController

  def index(conn, params) do
    vehicles = Data.list_vehicles()
    render(conn, "index.json", vehicles: vehicles)
  end

  def create(conn, params) do
    %{"vehicle" => vehicle_params} = params
    with {:ok, %Vehicle{} = vehicle} <- Data.create_vehicle(vehicle_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", vehicle_path(conn, :show, vehicle))
      |> render("show.json", vehicle: vehicle)
    end
  end

  def show(conn, %{"id" => id}) do
    vehicle = Data.get_vehicle!(id)
    render(conn, "show.json", vehicle: vehicle)
  end

  def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
    vehicle = Data.get_vehicle!(id)

    with {:ok, %Vehicle{} = vehicle} <- Data.update_vehicle(vehicle, vehicle_params) do
      render(conn, "show.json", vehicle: vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle = Data.get_vehicle!(id)
    with {:ok, %Vehicle{}} <- Data.delete_vehicle(vehicle) do
      send_resp(conn, :no_content, "")
    end
  end

  def search(conn, %{"year" => year, "make" => make, "model" => model}) do
    query = from vehicle in BuyVsLease.Data.Vehicle,
      select: vehicle,
      where: vehicle.year == ^year,
      where: ilike(vehicle.make, ^make),
      where: ilike(vehicle.model, ^model)

    vehicles = BuyVsLease.Repo.all(query)

    render(conn, "search_results.json", vehicles: vehicles)
  end

  def search_years(conn, _params) do
    query = from(v in Vehicle, distinct: true, select: v.year)
    years = BuyVsLease.Repo.all(query)

    render(conn, "years.json", years: years)
  end

  def search_makes(conn, %{"year" => year}) do
    query = from(
      v in Vehicle, distinct: true, select: v.make, where: v.year == ^year
    )

    makes = BuyVsLease.Repo.all(query)
    render(conn, "makes.json", makes: makes)
  end

  def search_models(conn, %{"year" => year, "make" => make}) do
    query = from(
      v in Vehicle,
      select: v.model,
      where: v.year == ^year,
      where: v.make == ^make,
    )

    models = BuyVsLease.Repo.all(query)
    render(conn, "models.json", models: models)
  end
end
