defmodule BuyVsLease.VehicleTest do
  use BuyVsLease.ModelCase

  alias BuyVsLease.Vehicle

  @valid_attrs %{make: "some make", model: "some model", msrp: 120.5, three_yr_lease: 120.5, two_yr_lease: 120.5, year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vehicle.changeset(%Vehicle{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vehicle.changeset(%Vehicle{}, @invalid_attrs)
    refute changeset.valid?
  end
end
