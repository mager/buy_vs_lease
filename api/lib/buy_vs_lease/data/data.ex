defmodule BuyVsLease.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias BuyVsLease.Repo

  alias BuyVsLease.Data.Vehicle

  @doc """
  Returns the list of vehicles.

  ## Examples

      iex> list_vehicles()
      [%Vehicle{}, ...]

  """
  def list_vehicles do
    Repo.all(Vehicle)
  end

  @doc """
  Gets a single vehicle.

  Raises `Ecto.NoResultsError` if the Vehicle does not exist.

  ## Examples

      iex> get_vehicle!(123)
      %Vehicle{}

      iex> get_vehicle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vehicle!(id), do: Repo.get!(Vehicle, id)

  @doc """
  Creates a vehicle.

  ## Examples

      iex> create_vehicle(%{field: value})
      {:ok, %Vehicle{}}

      iex> create_vehicle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vehicle(attrs \\ %{}) do
    %Vehicle{}
    |> Vehicle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vehicle.

  ## Examples

      iex> update_vehicle(vehicle, %{field: new_value})
      {:ok, %Vehicle{}}

      iex> update_vehicle(vehicle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vehicle(%Vehicle{} = vehicle, attrs) do
    vehicle
    |> Vehicle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Vehicle.

  ## Examples

      iex> delete_vehicle(vehicle)
      {:ok, %Vehicle{}}

      iex> delete_vehicle(vehicle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vehicle(%Vehicle{} = vehicle) do
    Repo.delete(vehicle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vehicle changes.

  ## Examples

      iex> change_vehicle(vehicle)
      %Ecto.Changeset{source: %Vehicle{}}

  """
  def change_vehicle(%Vehicle{} = vehicle) do
    Vehicle.changeset(vehicle, %{})
  end

  alias BuyVsLease.Data.Analysis

  @doc """
  Returns the list of analysis.

  ## Examples

      iex> list_analysis()
      [%Analysis{}, ...]

  """
  def list_analysis do
    Repo.all(Analysis)
  end

  @doc """
  Gets a single analysis.

  Raises `Ecto.NoResultsError` if the Analysis does not exist.

  ## Examples

      iex> get_analysis!(123)
      %Analysis{}

      iex> get_analysis!(456)
      ** (Ecto.NoResultsError)

  """
  def get_analysis!(id), do: Repo.get!(Analysis, id)

  @doc """
  Creates a analysis.

  ## Examples

      iex> create_analysis(%{field: value})
      {:ok, %Analysis{}}

      iex> create_analysis(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_analysis(attrs \\ %{}) do
    %Analysis{}
    |> Analysis.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a analysis.

  ## Examples

      iex> update_analysis(analysis, %{field: new_value})
      {:ok, %Analysis{}}

      iex> update_analysis(analysis, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_analysis(%Analysis{} = analysis, attrs) do
    analysis
    |> Analysis.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Analysis.

  ## Examples

      iex> delete_analysis(analysis)
      {:ok, %Analysis{}}

      iex> delete_analysis(analysis)
      {:error, %Ecto.Changeset{}}

  """
  def delete_analysis(%Analysis{} = analysis) do
    Repo.delete(analysis)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking analysis changes.

  ## Examples

      iex> change_analysis(analysis)
      %Ecto.Changeset{source: %Analysis{}}

  """
  def change_analysis(%Analysis{} = analysis) do
    Analysis.changeset(analysis, %{})
  end
end
