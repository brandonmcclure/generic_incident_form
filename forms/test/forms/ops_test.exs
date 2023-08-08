defmodule Forms.OpsTest do
  use Forms.DataCase

  alias Forms.Ops

  describe "incidents" do
    alias Forms.Ops.Incident

    import Forms.OpsFixtures

    @invalid_attrs %{description: nil, isemployeeinvolved: nil, isvehicleinvolved: nil, location: nil, name: nil}

    test "list_incidents/0 returns all incidents" do
      incident = incident_fixture()
      assert Ops.list_incidents() == [incident]
    end

    test "get_incident!/1 returns the incident with given id" do
      incident = incident_fixture()
      assert Ops.get_incident!(incident.id) == incident
    end

    test "create_incident/1 with valid data creates a incident" do
      valid_attrs = %{description: "some description", isemployeeinvolved: true, isvehicleinvolved: true, location: "some location", name: "some name"}

      assert {:ok, %Incident{} = incident} = Ops.create_incident(valid_attrs)
      assert incident.description == "some description"
      assert incident.isemployeeinvolved == true
      assert incident.isvehicleinvolved == true
      assert incident.location == "some location"
      assert incident.name == "some name"
    end

    test "create_incident/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ops.create_incident(@invalid_attrs)
    end

    test "update_incident/2 with valid data updates the incident" do
      incident = incident_fixture()
      update_attrs = %{description: "some updated description", isemployeeinvolved: false, isvehicleinvolved: false, location: "some updated location", name: "some updated name"}

      assert {:ok, %Incident{} = incident} = Ops.update_incident(incident, update_attrs)
      assert incident.description == "some updated description"
      assert incident.isemployeeinvolved == false
      assert incident.isvehicleinvolved == false
      assert incident.location == "some updated location"
      assert incident.name == "some updated name"
    end

    test "update_incident/2 with invalid data returns error changeset" do
      incident = incident_fixture()
      assert {:error, %Ecto.Changeset{}} = Ops.update_incident(incident, @invalid_attrs)
      assert incident == Ops.get_incident!(incident.id)
    end

    test "delete_incident/1 deletes the incident" do
      incident = incident_fixture()
      assert {:ok, %Incident{}} = Ops.delete_incident(incident)
      assert_raise Ecto.NoResultsError, fn -> Ops.get_incident!(incident.id) end
    end

    test "change_incident/1 returns a incident changeset" do
      incident = incident_fixture()
      assert %Ecto.Changeset{} = Ops.change_incident(incident)
    end
  end
end
