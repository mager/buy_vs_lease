defmodule BuyVsLeaseWeb.AnalysisController do
  use BuyVsLeaseWeb, :controller

  alias BuyVsLease.Data
  alias BuyVsLease.Data.Analysis
  alias BuyVsLease.Data.Vehicle

  action_fallback BuyVsLeaseWeb.FallbackController

  def index(conn, _params) do
    analysis = Data.list_analysis()
    render(conn, "index.json", analysis: analysis)
  end

  def create(conn, %{"analysis" => analysis_params}) do
    # Decide if they should buy or lease
    result = analyze_input(analysis_params)

    with {:ok, %Analysis{} = analysis} <- Data.create_analysis(Map.merge(analysis_params, result)) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", analysis_path(conn, :show, analysis))
      |> render("show.json", analysis: analysis)
    end
  end

  def show(conn, %{"id" => id}) do
    analysis = Data.get_analysis!(id)
    render(conn, "show.json", analysis: analysis)
  end

  def update(conn, %{"id" => id, "analysis" => analysis_params}) do
    analysis = Data.get_analysis!(id)

    with {:ok, %Analysis{} = analysis} <- Data.update_analysis(analysis, analysis_params) do
      render(conn, "show.json", analysis: analysis)
    end
  end

  def delete(conn, %{"id" => id}) do
    analysis = Data.get_analysis!(id)
    with {:ok, %Analysis{}} <- Data.delete_analysis(analysis) do
      send_resp(conn, :no_content, "")
    end
  end

  defp analyze_input(%{
    "id" => id,
    "lease_term" => lease_term,
    "down_payment" => down_payment,
    "monthly_payment" => monthly_payment
  } = analysis_params) do
    # Get the 2 or 3 year lease value
    vehicle = Vehicle |> BuyVsLease.Repo.get_by(id: id)
    lease_value = case (lease_term) do
      24 -> vehicle.two_yr_lease
      36 -> vehicle.three_yr_lease
    end

    # Get amount = down payment + (montlhy payment * term)
    dues = down_payment + (monthly_payment * lease_term)
    result = cond do
      dues < lease_value -> "buy"
      dues > lease_value -> "lease"
    end

    %{"result" => result}
  end
end
