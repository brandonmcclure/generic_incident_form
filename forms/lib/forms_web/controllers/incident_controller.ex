defmodule FormsWeb.IncidentController do
  use FormsWeb, :controller

  alias Forms.Ops
  alias Forms.Ops.Incident

  def index(conn, _params) do
    incidents = Ops.list_incidents()
    render(conn, :index, incidents: incidents)
  end

  def new(conn, _params) do
    changeset = Ops.change_incident(%Incident{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"incident" => incident_params}) do
    case Ops.create_incident(incident_params) do
      {:ok, incident} ->
        conn
        |> put_flash(:info, "Incident created successfully.")
        |> redirect(to: ~p"/incidents/#{incident}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    incident = Ops.get_incident!(id)
    render(conn, :show, incident: incident)
  end

  def edit(conn, %{"id" => id}) do
    incident = Ops.get_incident!(id)
    changeset = Ops.change_incident(incident)
    render(conn, :edit, incident: incident, changeset: changeset)
  end

  def update(conn, %{"id" => id, "incident" => incident_params}) do
    incident = Ops.get_incident!(id)

    case Ops.update_incident(incident, incident_params) do
      {:ok, incident} ->
        conn
        |> put_flash(:info, "Incident updated successfully.")
        |> redirect(to: ~p"/incidents/#{incident}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, incident: incident, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    incident = Ops.get_incident!(id)
    {:ok, _incident} = Ops.delete_incident(incident)

    conn
    |> put_flash(:info, "Incident deleted successfully.")
    |> redirect(to: ~p"/incidents")
  end
end
