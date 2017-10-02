defmodule BuyVsLease.Repo.Migrations.CreateAnalysis do
  use Ecto.Migration

  def change do
    create table(:analysis) do
      add :down_payment, :float
      add :monthly_payment, :float
      add :lease_term, :integer
      add :vehicle_id, references(:vehicles, on_delete: :nothing)

      timestamps()
    end

    create index(:analysis, [:vehicle_id])
  end
end
