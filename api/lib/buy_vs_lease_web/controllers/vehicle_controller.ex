defmodule BuyVsLeaseWeb.VehicleController do
  use BuyVsLeaseWeb, :controller

  alias BuyVsLease.Data
  alias BuyVsLease.Data.Vehicle

  action_fallback BuyVsLeaseWeb.FallbackController

  def index(conn, _params) do
    vehicles = Data.list_vehicles()
    render(conn, "index.json", vehicles: vehicles)
  end

  def create(conn, %{"vehicle" => vehicle_params}) do
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
end
