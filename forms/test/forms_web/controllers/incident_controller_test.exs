defmodule FormsWeb.IncidentControllerTest do
  use FormsWeb.ConnCase

  import Forms.OpsFixtures

  @create_attrs %{description: "some description", isemployeeinvolved: true, isvehicleinvolved: true, location: "some location", name: "some name"}
  @update_attrs %{description: "some updated description", isemployeeinvolved: false, isvehicleinvolved: false, location: "some updated location", name: "some updated name"}
  @invalid_attrs %{description: nil, isemployeeinvolved: nil, isvehicleinvolved: nil, location: nil, name: nil}

  describe "index" do
    test "lists all incidents", %{conn: conn} do
      conn = get(conn, ~p"/incidents")
      assert html_response(conn, 200) =~ "Listing Incidents"
    end
  end

  describe "new incident" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/incidents/new")
      assert html_response(conn, 200) =~ "New Incident"
    end
  end

  describe "create incident" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/incidents", incident: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/incidents/#{id}"

      conn = get(conn, ~p"/incidents/#{id}")
      assert html_response(conn, 200) =~ "Incident #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/incidents", incident: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Incident"
    end
  end

  describe "edit incident" do
    setup [:create_incident]

    test "renders form for editing chosen incident", %{conn: conn, incident: incident} do
      conn = get(conn, ~p"/incidents/#{incident}/edit")
      assert html_response(conn, 200) =~ "Edit Incident"
    end
  end

  describe "update incident" do
    setup [:create_incident]

    test "redirects when data is valid", %{conn: conn, incident: incident} do
      conn = put(conn, ~p"/incidents/#{incident}", incident: @update_attrs)
      assert redirected_to(conn) == ~p"/incidents/#{incident}"

      conn = get(conn, ~p"/incidents/#{incident}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, incident: incident} do
      conn = put(conn, ~p"/incidents/#{incident}", incident: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Incident"
    end
  end

  describe "delete incident" do
    setup [:create_incident]

    test "deletes chosen incident", %{conn: conn, incident: incident} do
      conn = delete(conn, ~p"/incidents/#{incident}")
      assert redirected_to(conn) == ~p"/incidents"

      assert_error_sent 404, fn ->
        get(conn, ~p"/incidents/#{incident}")
      end
    end
  end

  defp create_incident(_) do
    incident = incident_fixture()
    %{incident: incident}
  end
end
