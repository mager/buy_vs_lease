defmodule BuyVsLease.DataTest do
  use BuyVsLease.DataCase

  alias BuyVsLease.Data

  describe "vehicles" do
    alias BuyVsLease.Data.Vehicle

    @valid_attrs %{make: "some make", model: "some model", msrp: 120.5, three_yr_lease: 120.5, trim: "some trim", two_yr_lease: 120.5, year: 42}
    @update_attrs %{make: "some updated make", model: "some updated model", msrp: 456.7, three_yr_lease: 456.7, trim: "some updated trim", two_yr_lease: 456.7, year: 43}
    @invalid_attrs %{make: nil, model: nil, msrp: nil, three_yr_lease: nil, trim: nil, two_yr_lease: nil, year: nil}

    def vehicle_fixture(attrs \\ %{}) do
      {:ok, vehicle} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_vehicle()

      vehicle
    end

    test "list_vehicles/0 returns all vehicles" do
      vehicle = vehicle_fixture()
      assert Data.list_vehicles() == [vehicle]
    end

    test "get_vehicle!/1 returns the vehicle with given id" do
      vehicle = vehicle_fixture()
      assert Data.get_vehicle!(vehicle.id) == vehicle
    end

    test "create_vehicle/1 with valid data creates a vehicle" do
      assert {:ok, %Vehicle{} = vehicle} = Data.create_vehicle(@valid_attrs)
      assert vehicle.make == "some make"
      assert vehicle.model == "some model"
      assert vehicle.msrp == 120.5
      assert vehicle.three_yr_lease == 120.5
      assert vehicle.trim == "some trim"
      assert vehicle.two_yr_lease == 120.5
      assert vehicle.year == 42
    end

    test "create_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_vehicle(@invalid_attrs)
    end

    test "update_vehicle/2 with valid data updates the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, vehicle} = Data.update_vehicle(vehicle, @update_attrs)
      assert %Vehicle{} = vehicle
      assert vehicle.make == "some updated make"
      assert vehicle.model == "some updated model"
      assert vehicle.msrp == 456.7
      assert vehicle.three_yr_lease == 456.7
      assert vehicle.trim == "some updated trim"
      assert vehicle.two_yr_lease == 456.7
      assert vehicle.year == 43
    end

    test "update_vehicle/2 with invalid data returns error changeset" do
      vehicle = vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_vehicle(vehicle, @invalid_attrs)
      assert vehicle == Data.get_vehicle!(vehicle.id)
    end

    test "delete_vehicle/1 deletes the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, %Vehicle{}} = Data.delete_vehicle(vehicle)
      assert_raise Ecto.NoResultsError, fn -> Data.get_vehicle!(vehicle.id) end
    end

    test "change_vehicle/1 returns a vehicle changeset" do
      vehicle = vehicle_fixture()
      assert %Ecto.Changeset{} = Data.change_vehicle(vehicle)
    end
  end

  describe "analysis" do
    alias BuyVsLease.Data.Analysis

    @valid_attrs %{down_payment: 120.5, lease_term: 42, monthly_payment: 120.5}
    @update_attrs %{down_payment: 456.7, lease_term: 43, monthly_payment: 456.7}
    @invalid_attrs %{down_payment: nil, lease_term: nil, monthly_payment: nil}

    def analysis_fixture(attrs \\ %{}) do
      {:ok, analysis} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_analysis()

      analysis
    end

    test "list_analysis/0 returns all analysis" do
      analysis = analysis_fixture()
      assert Data.list_analysis() == [analysis]
    end

    test "get_analysis!/1 returns the analysis with given id" do
      analysis = analysis_fixture()
      assert Data.get_analysis!(analysis.id) == analysis
    end

    test "create_analysis/1 with valid data creates a analysis" do
      assert {:ok, %Analysis{} = analysis} = Data.create_analysis(@valid_attrs)
      assert analysis.down_payment == 120.5
      assert analysis.lease_term == 42
      assert analysis.monthly_payment == 120.5
    end

    test "create_analysis/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_analysis(@invalid_attrs)
    end

    test "update_analysis/2 with valid data updates the analysis" do
      analysis = analysis_fixture()
      assert {:ok, analysis} = Data.update_analysis(analysis, @update_attrs)
      assert %Analysis{} = analysis
      assert analysis.down_payment == 456.7
      assert analysis.lease_term == 43
      assert analysis.monthly_payment == 456.7
    end

    test "update_analysis/2 with invalid data returns error changeset" do
      analysis = analysis_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_analysis(analysis, @invalid_attrs)
      assert analysis == Data.get_analysis!(analysis.id)
    end

    test "delete_analysis/1 deletes the analysis" do
      analysis = analysis_fixture()
      assert {:ok, %Analysis{}} = Data.delete_analysis(analysis)
      assert_raise Ecto.NoResultsError, fn -> Data.get_analysis!(analysis.id) end
    end

    test "change_analysis/1 returns a analysis changeset" do
      analysis = analysis_fixture()
      assert %Ecto.Changeset{} = Data.change_analysis(analysis)
    end
  end
end
