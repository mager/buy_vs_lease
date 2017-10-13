defmodule BuyVsLease.Repo.Migrations.AnalysisAddResult do
  use Ecto.Migration

  def change do
    alter table(:analysis) do
      add :result, :string
    end
  end
end
