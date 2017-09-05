defmodule BuyVsLease.VehicleController do
  use BuyVsLease.Web, :controller

  alias BuyVsLease.Vehicle

  def index(conn, _params) do
    vehicles = Repo.all(Vehicle)
    render(conn, "index.json", vehicles: vehicles)
  end

  def create(conn, %{"vehicle" => vehicle_params}) do
    changeset = Vehicle.changeset(%Vehicle{}, vehicle_params)

    case Repo.insert(changeset) do
      {:ok, vehicle} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", vehicle_path(conn, :show, vehicle))
        |> render("show.json", vehicle: vehicle)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BuyVsLease.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vehicle = Repo.get!(Vehicle, id)
    render(conn, "show.json", vehicle: vehicle)
  end

  def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
    vehicle = Repo.get!(Vehicle, id)
    changeset = Vehicle.changeset(vehicle, vehicle_params)

    case Repo.update(changeset) do
      {:ok, vehicle} ->
        render(conn, "show.json", vehicle: vehicle)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BuyVsLease.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle = Repo.get!(Vehicle, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(vehicle)

    send_resp(conn, :no_content, "")
  end
end
