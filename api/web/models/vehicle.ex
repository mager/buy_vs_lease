defmodule BuyVsLease.Vehicle do
  use BuyVsLease.Web, :model

  schema "vehicles" do
    field :make, :string
    field :model, :string
    field :year, :integer
    field :two_yr_lease, :float
    field :three_yr_lease, :float
    field :msrp, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:make, :model, :year, :two_yr_lease, :three_yr_lease, :msrp])
    |> validate_required([:make, :model, :year, :two_yr_lease, :three_yr_lease, :msrp])
  end
end
