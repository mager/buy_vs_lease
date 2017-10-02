defmodule BuyVsLeaseWeb.AnalysisController do
  use BuyVsLeaseWeb, :controller

  alias BuyVsLease.Data
  alias BuyVsLease.Data.Analysis

  action_fallback BuyVsLeaseWeb.FallbackController

  def index(conn, _params) do
    analysis = Data.list_analysis()
    render(conn, "index.json", analysis: analysis)
  end

  def create(conn, %{"analysis" => analysis_params}) do
    with {:ok, %Analysis{} = analysis} <- Data.create_analysis(analysis_params) do
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
end
