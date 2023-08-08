defmodule Forms.OpsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Forms.Ops` context.
  """

  @doc """
  Generate a incident.
  """
  def incident_fixture(attrs \\ %{}) do
    {:ok, incident} =
      attrs
      |> Enum.into(%{
        description: "some description",
        isemployeeinvolved: true,
        isvehicleinvolved: true,
        location: "some location",
        name: "some name"
      })
      |> Forms.Ops.create_incident()

    incident
  end
end
