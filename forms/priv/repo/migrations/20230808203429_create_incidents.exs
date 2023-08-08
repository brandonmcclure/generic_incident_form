defmodule Forms.Repo.Migrations.CreateIncidents do
  use Ecto.Migration

  def change do
    create table(:incidents) do
      add :name, :string
      add :description, :string
      add :isemployeeinvolved, :boolean, default: false, null: false
      add :isvehicleinvolved, :boolean, default: false, null: false
      add :location, :string

      timestamps()
    end
  end
end
