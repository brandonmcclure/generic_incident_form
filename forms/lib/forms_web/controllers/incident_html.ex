defmodule FormsWeb.IncidentHTML do
  use FormsWeb, :html

  embed_templates "incident_html/*"

  @doc """
  Renders a incident form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def incident_form(assigns)
end
