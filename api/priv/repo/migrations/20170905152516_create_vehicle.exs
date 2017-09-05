defmodule BuyVsLease.Repo.Migrations.CreateVehicle do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :make, :string
      add :model, :string
      add :year, :integer
      add :two_yr_lease, :float
      add :three_yr_lease, :float
      add :msrp, :float

      timestamps()
    end
  end
end
