defmodule ElixirSeoWeb.PageController do
  use ElixirSeoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
