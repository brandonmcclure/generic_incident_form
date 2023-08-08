defmodule Forms.Ops.Incident do
  use Ecto.Schema
  import Ecto.Changeset

  schema "incidents" do
    field :description, :string
    field :isemployeeinvolved, :boolean, default: false
    field :isvehicleinvolved, :boolean, default: false
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(incident, attrs) do
    incident
    |> cast(attrs, [:name, :description, :isemployeeinvolved, :isvehicleinvolved, :location])
    |> validate_required([:name, :description, :isemployeeinvolved, :isvehicleinvolved, :location])
  end
end
