defmodule BuyVsLeaseWeb.VehicleView do
  use BuyVsLeaseWeb, :view
  alias BuyVsLeaseWeb.VehicleView

  def render("index.json", %{vehicles: vehicles}) do
    %{data: render_many(vehicles, VehicleView, "vehicle.json")}
  end

  def render("show.json", %{vehicle: vehicle}) do
    %{data: render_one(vehicle, VehicleView, "vehicle.json")}
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    %{
      id: vehicle.id,
      make: vehicle.make,
      model: vehicle.model,
      year: vehicle.year,
      two_yr_lease: vehicle.two_yr_lease,
      three_yr_lease: vehicle.three_yr_lease,
      msrp: vehicle.msrp,
      trim: vehicle.trim
    }
  end

  def render("search_results.json", %{vehicles: vehicles}) do
    %{data: render_many(vehicles, VehicleView, "vehicle.json")}
  end

  def render("years.json", %{years: years}) do
    %{years: years}
  end

  def render("makes.json", %{makes: makes}) do
    %{makes: makes}
  end

  def render("models.json", %{models: models}) do
    %{models: models}
  end
end
