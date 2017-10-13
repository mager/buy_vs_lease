defmodule BuyVsLease.Data.Analysis do
  use Ecto.Schema
  import Ecto.Changeset
  alias BuyVsLease.Data.Analysis


  schema "analysis" do
    field :down_payment, :float
    field :lease_term, :integer
    field :monthly_payment, :float
    field :vehicle_id, :id
    field :result, :string

    timestamps()
  end

  @doc false
  def changeset(%Analysis{} = analysis, attrs) do
    analysis
    |> cast(attrs, [:down_payment, :monthly_payment, :lease_term, :result])
    |> validate_required([:down_payment, :monthly_payment, :lease_term, :result])
  end
end
