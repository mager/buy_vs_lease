defmodule BuyVsLease.Data.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset
  alias BuyVsLease.Data.Vehicle


  schema "vehicles" do
    field :make, :string
    field :model, :string
    field :msrp, :float
    field :three_yr_lease, :float
    field :trim, :string
    field :two_yr_lease, :float
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(%Vehicle{} = vehicle, attrs) do
    vehicle
    |> cast(attrs, [:make, :model, :year, :two_yr_lease, :three_yr_lease, :msrp, :trim])
    |> validate_required([:make, :model, :year, :two_yr_lease, :three_yr_lease, :msrp, :trim])
  end
end
