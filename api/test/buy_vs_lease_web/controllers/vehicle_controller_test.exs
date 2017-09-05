defmodule BuyVsLeaseWeb.VehicleControllerTest do
  use BuyVsLeaseWeb.ConnCase

  alias BuyVsLease.Data
  alias BuyVsLease.Data.Vehicle

  @create_attrs %{make: "some make", model: "some model", msrp: 120.5, three_yr_lease: 120.5, trim: "some trim", two_yr_lease: 120.5, year: 42}
  @update_attrs %{make: "some updated make", model: "some updated model", msrp: 456.7, three_yr_lease: 456.7, trim: "some updated trim", two_yr_lease: 456.7, year: 43}
  @invalid_attrs %{make: nil, model: nil, msrp: nil, three_yr_lease: nil, trim: nil, two_yr_lease: nil, year: nil}

  def fixture(:vehicle) do
    {:ok, vehicle} = Data.create_vehicle(@create_attrs)
    vehicle
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vehicles", %{conn: conn} do
      conn = get conn, vehicle_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vehicle" do
    test "renders vehicle when data is valid", %{conn: conn} do
      conn = post conn, vehicle_path(conn, :create), vehicle: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, vehicle_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "make" => "some make",
        "model" => "some model",
        "msrp" => 120.5,
        "three_yr_lease" => 120.5,
        "trim" => "some trim",
        "two_yr_lease" => 120.5,
        "year" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, vehicle_path(conn, :create), vehicle: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vehicle" do
    setup [:create_vehicle]

    test "renders vehicle when data is valid", %{conn: conn, vehicle: %Vehicle{id: id} = vehicle} do
      conn = put conn, vehicle_path(conn, :update, vehicle), vehicle: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, vehicle_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "make" => "some updated make",
        "model" => "some updated model",
        "msrp" => 456.7,
        "three_yr_lease" => 456.7,
        "trim" => "some updated trim",
        "two_yr_lease" => 456.7,
        "year" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, vehicle: vehicle} do
      conn = put conn, vehicle_path(conn, :update, vehicle), vehicle: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vehicle" do
    setup [:create_vehicle]

    test "deletes chosen vehicle", %{conn: conn, vehicle: vehicle} do
      conn = delete conn, vehicle_path(conn, :delete, vehicle)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, vehicle_path(conn, :show, vehicle)
      end
    end
  end

  defp create_vehicle(_) do
    vehicle = fixture(:vehicle)
    {:ok, vehicle: vehicle}
  end
end
