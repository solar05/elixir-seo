defmodule ElixirSeoWeb.DomainView do
  use ElixirSeoWeb, :view

  def present_state(state) do
    render("states.html", state: state)
  end

end
