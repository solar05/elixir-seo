defmodule ElixirSeoWeb.DomainController do
  use ElixirSeoWeb, :controller
  import ElixirSeoWeb.Helpers.WebHelper

  alias ElixirSeo.Domains
  alias ElixirSeo.Domains.Domain

  def index(conn, _params) do
    domains = Domains.list_domains()
    render(conn, "index.html", domains: domains)
  end

  def new(conn, _params) do
    changeset = Domains.change_domain(%Domain{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"domain" => domain_params}) do
    {:ok, url} = validate_url(domain_params)

    case Domains.create_domain(%{name: url, state: "created"}) do
      {:ok, domain} ->
        conn
        |> put_flash(:info, "Domain added successfully.")
        |> redirect(to: Routes.domain_path(conn, :show, domain))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Invalid domain url.")
        |> render("new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    domain = Domains.get_domain!(id)
    render(conn, "show.html", domain: domain)
  end

  def edit(conn, %{"id" => id}) do
    domain = Domains.get_domain!(id)
    changeset = Domains.change_domain(domain)
    render(conn, "edit.html", domain: domain, changeset: changeset)
  end

  def update(conn, %{"id" => id, "domain" => domain_params}) do
    domain = Domains.get_domain!(id)
    {:ok, url} = validate_url(domain_params)

    case Domains.update_domain(domain, %{"name" => url}) do
      {:ok, domain} ->
        conn
        |> put_flash(:info, "Domain updated successfully.")
        |> redirect(to: Routes.domain_path(conn, :show, domain))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", domain: domain, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    domain = Domains.get_domain!(id)
    {:ok, _domain} = Domains.delete_domain(domain)

    conn
    |> put_flash(:info, "Domain deleted successfully.")
    |> redirect(to: Routes.domain_path(conn, :index))
  end
end
