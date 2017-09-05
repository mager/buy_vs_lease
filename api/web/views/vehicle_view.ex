defmodule BuyVsLease.VehicleView do
  use BuyVsLease.Web, :view

  def render("index.json", %{vehicles: vehicles}) do
    %{data: render_many(vehicles, BuyVsLease.VehicleView, "vehicle.json")}
  end

  def render("show.json", %{vehicle: vehicle}) do
    %{data: render_one(vehicle, BuyVsLease.VehicleView, "vehicle.json")}
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    %{id: vehicle.id,
      make: vehicle.make,
      model: vehicle.model,
      year: vehicle.year,
      two_yr_lease: vehicle.two_yr_lease,
      three_yr_lease: vehicle.three_yr_lease,
      msrp: vehicle.msrp}
  end
end
