defmodule BuyVsLeaseWeb.AnalysisView do
  use BuyVsLeaseWeb, :view
  alias BuyVsLeaseWeb.AnalysisView

  def render("index.json", %{analysis: analysis}) do
    %{data: render_many(analysis, AnalysisView, "analysis.json")}
  end

  def render("show.json", %{analysis: analysis}) do
    %{data: render_one(analysis, AnalysisView, "analysis.json")}
  end

  def render("analysis.json", %{analysis: analysis}) do
    %{id: analysis.id,
      down_payment: analysis.down_payment,
      monthly_payment: analysis.monthly_payment,
      lease_term: analysis.lease_term}
  end
end
