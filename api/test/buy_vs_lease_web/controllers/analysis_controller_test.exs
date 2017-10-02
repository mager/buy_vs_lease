defmodule BuyVsLeaseWeb.AnalysisControllerTest do
  use BuyVsLeaseWeb.ConnCase

  alias BuyVsLease.Data
  alias BuyVsLease.Data.Analysis

  @create_attrs %{down_payment: 120.5, lease_term: 42, monthly_payment: 120.5}
  @update_attrs %{down_payment: 456.7, lease_term: 43, monthly_payment: 456.7}
  @invalid_attrs %{down_payment: nil, lease_term: nil, monthly_payment: nil}

  def fixture(:analysis) do
    {:ok, analysis} = Data.create_analysis(@create_attrs)
    analysis
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all analysis", %{conn: conn} do
      conn = get conn, analysis_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create analysis" do
    test "renders analysis when data is valid", %{conn: conn} do
      conn = post conn, analysis_path(conn, :create), analysis: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, analysis_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "down_payment" => 120.5,
        "lease_term" => 42,
        "monthly_payment" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, analysis_path(conn, :create), analysis: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update analysis" do
    setup [:create_analysis]

    test "renders analysis when data is valid", %{conn: conn, analysis: %Analysis{id: id} = analysis} do
      conn = put conn, analysis_path(conn, :update, analysis), analysis: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, analysis_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "down_payment" => 456.7,
        "lease_term" => 43,
        "monthly_payment" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, analysis: analysis} do
      conn = put conn, analysis_path(conn, :update, analysis), analysis: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete analysis" do
    setup [:create_analysis]

    test "deletes chosen analysis", %{conn: conn, analysis: analysis} do
      conn = delete conn, analysis_path(conn, :delete, analysis)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, analysis_path(conn, :show, analysis)
      end
    end
  end

  defp create_analysis(_) do
    analysis = fixture(:analysis)
    {:ok, analysis: analysis}
  end
end
